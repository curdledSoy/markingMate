// formkit.config.js
import { generateClasses } from '@formkit/themes'
import { genesisIcons } from '@formkit/icons'
import '@formkit/themes/genesis'
import genesis from '@formkit/themes/tailwindcss/genesis'
export default {
  icons: {
    ...genesisIcons,
  },
  config: {
    classes: generateClasses(genesis),
  },
}