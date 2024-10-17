import { MicrosoftRewardsBot } from "./index"

const bot = new MicrosoftRewardsBot()

// Initialize accounts first and then start the bot
bot.initialize().then(() => {
    bot.run()
})
