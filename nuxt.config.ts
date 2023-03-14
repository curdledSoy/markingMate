// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    modules: [
        '@pinia/nuxt',
        'nuxt-windicss',
        '@vueuse/nuxt',
        '@formkit/nuxt',

    ],
    pinia: {
        autoImports: [
            'defineStore'
        ]
    }

})
