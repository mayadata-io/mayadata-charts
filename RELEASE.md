### KUBERA ENTERPRISE RELEASE GUIDELINES
- Repositories use release version according to the [Semantic Versioning](https://semver.org/), except the <b>TechPreview</b> series

- Release version should be the same in each module

- Docker images with release tags are pushed upon creation of a GitHub release 

### Following are the docker images:

- KUBERA-CHAOS IMAGES
  -   [mayadataio/kubera-litmus-server](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/kubera-litmus-server)
  -   [mayadataio/kubera-litmus-webui](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/kubera-litmus-webui)
  -   [mayadataio/kubera-litmus-subscriber](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/kubera-litmus-subscriber)

- KUBERA-PROPEL IMAGES
  -   [mayadataio/kubera-propel-webapp](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/kubera-propel-webapp)
  -   [mayadataio/kubera-propel-server](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/kubera-propel-server)
  -   [mayadataio/kubera-propel-agent-subscriber](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/kubera-propel-agent-subscriber)
  -   [mayadataio/kubera-propel-agent-controller](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/kubera-propel-agent-controller)
  -   [mayadataio/kubera-propel-iscsi-ubuntu](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/kubera-propel-iscsi-ubuntu)
  -   [mayadataio/kubera-propel-fio](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/kubera-propel-fio)
  -   [mayadataio/kubera-action](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/kubera-action)

- KUBERA-AUTH IMAGE
  -   [mayadataio/kubera-auth](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/kubera-auth)

- AGENT-GATEWAY IMAGES
  -   [mayadataio/gateway-server](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/gateway-server)
  -   [mayadataio/gateway-client](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/gateway-client)

- KUBERA-CORE-UI IMAGE
  -   [mayadataio/kubera-core-ui](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/kubera-core-ui)

- KUBERA-CORE-SERVER IMAGE
  -   [mayadataio/kubera-core-server](https://cloud.docker.com/u/mayadataio/repository/docker/mayadataio/kubera-core-server)

### Kubera Enterprise Modules
  - [mayadata-io/kubera-litmus](https://github.com/mayadata-io/kubera-litmus)
  - [mayadata-io/kubera-metal](https://github.com/mayadata-io/kubera-metal)
  - [mayadata-io/kubera-auth](https://github.com/mayadata-io/kubera-auth)
  - [mayadata-io/agent-gateway](https://github.com/mayadata-io/agent-gateway)
  - [mayadata-io/kubera-core-ui](https://github.com/mayadata-io/kubera-core-ui)
  - [mayadata-io/kubera-core-server](https://github.com/mayadata-io/kubera-core-server)

### Release Process (Needs to follow in the sequential manner)
  - It starts with making release branch in each of modules
    Note- kubera-core-server release branch should be created at last
    
  - Change `source_branch` from `master` to `release_branch` in `.circleci/config.yaml` in the release branch 
    ```bash
    else
        tag="$CIRCLE_BRANCH-ci"
        source_branch="master"
        build_type="ci"
    fi;
    ```
  - Make GitHub tags with the release version for each of modules
    Notes: 
    - kubera-core-server github tag should be created at last
    - If build is made from branch, circleci scripts would pick the image name as <branch_name>-ci,
    - If build is made from git tag, circleci scripts would pick the image name as

  - Wait for the build to be finished in each of the modules
  
  - Releasing helm charts
     - Make a branch out of the master 
        Note: Don't name the checkout branch with the release version
     - Change the `image.tag` to release version in `values.yaml`
       ```yaml
        image:
            registry: docker.io
            organization: mayadataio
            tag: # RELEASE_VERION
       ```
     - Make a GitHub tag with the same release version from this branch
       ```bash 
       git tag -fa TechPreview-3 -m "release TechPreview-3"
       git push origin TechPreview-3
       ``` 
       Or, Make it from the github UI

       
### Terminologies
- Release branch
   - This branch will freeze the code for the particular release
   - Example 
     - TechPreview-1
     - v1.0.x 
- Release Version
   - To release a version, GitHub tag needs to be created from the release branch.
   - Example
     - TechPreview-1
     - v1.0.1
- Docker image
  - During the code build process, docker images are getting created and push to the Docker hub
  - Example
    - `master-ci` - it is created if commits have been pushed to the branch. Note- Applicable for theses branches- master, TechPreview* and v*
    - `1.0.1` - it is created after we make the GitHub tags
