import Browser from './browser/Browser'
import { log } from './util/Logger'
import { loadAccounts, saveSessionData } from './util/Load'

import { Login } from './functions/Login'
import { MicrosoftRewardsBot } from './index'
// Main bot class
export class AccountTestBot {
    public bot: MicrosoftRewardsBot
    private login: Login
    private browserFactory: Browser
    constructor() {
        this.bot = new MicrosoftRewardsBot()
        this.login = new Login(this.bot)
        this.browserFactory = new Browser(this.bot)
    }


    async run() {
        const accounts = loadAccounts()
        for (const account of accounts) {
            log('MAIN-WORKER', `Started tasks for account ${account.email}`)
            const browser = await this.browserFactory.createBrowser(account.proxy, account.email)
            const homePage = await browser.newPage()
            await this.login.login(homePage, account.email, account.password)
            // Save cookies
            await saveSessionData(this.bot.config.sessionPath, browser, account.email, false)
            // Close browser
            await browser.close()

            log('MAIN-WORKER', `Completed tasks for account ${account.email}`)
        }
        process.exit(0)
    }
}

const bot = new AccountTestBot()
bot.run();