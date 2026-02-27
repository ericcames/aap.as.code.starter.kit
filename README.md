The Ansible Automation Platform Starter Kit
=============

**Getting started**

1. Ensure that we have a certified credential
    - Name
    ```
    Automation Hub - certified
    ```
    - Credential type
    ```
    Ansible Galaxy/Automation Hub API Token
    ```
    - Galaxy Server URL
    ```
    https://console.redhat.com/api/automation-hub/content/published/
    ```
    - Auth Server URL
    ```
    https://sso.redhat.com/auth/realms/redhat-external/protocol/openid-connect/token
    ```

![alt text](https://github.com/ericcames/aap.as.code/blob/main/images/AHcertified.png "certified")

2. Ensure that we have a validated credential
    - Name
    ```
    Automation Hub - validated
    ```
    - Credential type
    ```
    Ansible Galaxy/Automation Hub API Token
    ```
    - Galaxy Server URL
    ```
    https://console.redhat.com/api/automation-hub/content/validated/
    ```
    - Auth Server URL
    ```
    https://sso.redhat.com/auth/realms/redhat-external/protocol/openid-connect/token
    ```

3. Ensure the Galaxy credentials are related to the Default Organization
![alt text](https://github.com/ericcames/aap.as.code/blob/main/images/orgswithcreds.png "Default Organization")

4. Create your vault credential
![alt text](https://github.com/ericcames/aap.as.code/blob/main/images/myvault.png "Vault")

5. Create your project
![alt text](https://github.com/ericcames/aap.as.code/blob/main/images/project.png "aap.as.code")

6. Create a remote vault with your secrets

[Remote Vault](https://raw.githubusercontent.com/ericcames/sourcefiles/refs/heads/main/vault_ames.yml "vault_ames.yml")<br>
[Example Vault](https://github.com/ericcames/aap.as.code.starter.kit/blob/main/playbooks/files/vault_example.yml "vault_example.yml")<br>

7. Create your job template
![alt text](https://github.com/ericcames/aap.as.code/blob/main/images/newtemplate.png "Setup - AAP - CAC")

Template name
```
Setup - AAP - CAC
```

Extra variables
```
my_remote_vault: >-
  https://raw.githubusercontent.com/ericcames/sourcefiles/refs/heads/main/starterkit_vault.yml
```