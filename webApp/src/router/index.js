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
      path: '/expenditurelist',
      name: 'expenditurelist',
      components: {
        Nav: Nav,
        content: expenditurelist
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
