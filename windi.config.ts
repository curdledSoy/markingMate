import { defineConfig } from 'windicss/helpers'
const FormKitVariants = require('@formkit/themes/windicss')
export default defineConfig({
    darkMode: 'class',
    content: [
        './src/**/*.{html,js,vue}',
        './node_modules/@formkit/themes/dist/windicss/index.cjs',
      ],
      plugins: [FormKitVariants],
    
})