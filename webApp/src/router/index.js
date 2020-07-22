import Vue from 'vue'
import VueRouter from 'vue-router'
import OngoingProjects from '@/components/OngoingProjects'
// eslint-disable-next-line no-unused-vars
import index from '@/components/index'
import Nav from '@/components/Nav'
import ProjectDetails from '@/components/ProjectDetails'
import Receivables from '@/components/Receivables'
import expenditure from '@/components/expenditure'
import SupplierList from '@/components/SupplierList'
import Customerlist from '@/components/Customerlist'
import Receivableslist from '@/components/Receivableslist'
import expenditurelist from '@/components/expenditurelist'
import RevenueContract from '@/components/RevenueContract'
import expenditureContract from '@/components/expenditureContract'
import SupplierData from '@/components/SupplierData'
import profitlist from '@/components/profitlist'
import stafflist from '@/components/stafflist'
import SupplierDatalist from '@/components/SupplierDatalist'
import login from '@/components/login'

Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    {
      path: '/ProjectDetails/:id',
      name: 'ProjectDetails',
      components: {
        Nav: Nav,
        content: ProjectDetails
      }
    },
    {
      path: '/expenditure/:id',
      name: 'expenditure',
      components: {
        Nav: Nav,
        content: expenditure
      }
    },
    {
      path: '/RevenueContract/:id',
      name: 'RevenueContract',
      components: {
        Nav: Nav,
        content: RevenueContract
      }
    },
    {
      path: '/SupplierDatalist/:id',
      name: 'SupplierDatalist',
      components: {
        Nav: Nav,
        content: SupplierDatalist
      }
    },
    {
      path: '/stafflist',
      name: 'stafflist',
      components: {
        Nav: Nav,
        content: stafflist
      }
    },
    {
      path: '/login',
      name: 'login',
      components: {
        Nav: Nav,
        content: login
      }
    },
    {
      path: '/expenditurelist',
      name: 'expenditurelist',
      components: {
        Nav: Nav,
        content: expenditurelist
      }
    },
    {
      path: '/profitlist',
      name: 'profitlist',
      components: {
        Nav: Nav,
        content: profitlist
      }
    },
    {
      path: '/SupplierData',
      name: 'SupplierData',
      components: {
        Nav: Nav,
        content: SupplierData
      }
    },
    {
      path: '/expenditureContract/:id',
      name: 'expenditureContract',
      components: {
        Nav: Nav,
        content: expenditureContract
      }
    },
    {
      path: '/index',
      name: 'index',
      components: {
        Nav: Nav,
        content: OngoingProjects
      }
    },
    {
      path: '/Receivables/:id',
      name: 'Receivables',
      components: {
        Nav: Nav,
        content: Receivables
      }
    },
    {
      path: '/Receivableslist/',
      name: 'Receivableslist',
      components: {
        Nav: Nav,
        content: Receivableslist
      }
    },
    {
      path: '/SupplierList/',
      name: 'SupplierList',
      components: {
        Nav: Nav,
        content: SupplierList
      }
    },
    {
      path: '/Customerlist/',
      name: 'Customerlist',
      components: {
        Nav: Nav,
        content: Customerlist
      }
    }
  ]
})

// 挂载一个路由导航守卫
router.beforeEach((to, from, next) => {
  console.log(to, from)
  next()
})
export default router
