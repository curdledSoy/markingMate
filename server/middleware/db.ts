import prisma from '../utils/prisma'

export default defineEventHandler((event) => {
    event.context.prisma = prisma
})