import { Authority } from '@/shared/security/authority';

const UnUserManagementComponent = () => import('@/admin/user-management/user-management.vue');
const UnUserManagementViewComponent = () => import('@/admin/user-management/user-management-view.vue');
const UnUserManagementEditComponent = () => import('@/admin/user-management/user-management-edit.vue');
const UnDocsComponent = () => import('@/admin/docs/docs.vue');

export default [
  {
    path: '/admin/user-management',
    name: 'UnUser',
    component: UnUserManagementComponent,
    meta: { authorities: [Authority.ADMIN] },
  },
  {
    path: '/admin/user-management/new',
    name: 'UnUserCreate',
    component: UnUserManagementEditComponent,
    meta: { authorities: [Authority.ADMIN] },
  },
  {
    path: '/admin/user-management/:userId/edit',
    name: 'UnUserEdit',
    component: UnUserManagementEditComponent,
    meta: { authorities: [Authority.ADMIN] },
  },
  {
    path: '/admin/user-management/:userId/view',
    name: 'UnUserView',
    component: UnUserManagementViewComponent,
    meta: { authorities: [Authority.ADMIN] },
  },
  {
    path: '/admin/docs',
    name: 'UnDocsComponent',
    component: UnDocsComponent,
    meta: { authorities: [Authority.ADMIN] },
  },
];
