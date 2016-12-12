{
  deployment = {
    kubernetes.namespaces.roles = {};
    kubernetes.roles.test = {
      rules = [{
        resources = ["pods"];
        verbs = ["get" "watch" "list"];
      }];
    };
    kubernetes.clusterRoles.test = {
      rules = [{
        resources = ["pods"];
        verbs = ["get" "watch" "list"];
      }];
    };
    kubernetes.roleBindings.test = {
      subjects = [{
        kind = "User";
        name = "admin";
      }];
      roleRef.name = "test";
    };
    kubernetes.clusterRoleBindings.test = {
      subjects = [{
        kind = "User";
        name = "admin";
      }];
      roleRef.name = "test";
    };
  };
}
