import Vue from 'vue'
import Router from 'vue-router'
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

Vue.use(Router)

export default new Router({

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
      path: '/stafflist',
      name: 'stafflist',
      components: {
        Nav: Nav,
        content: stafflist
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
