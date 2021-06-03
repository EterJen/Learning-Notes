- # Generating a new SSH key and adding it to the ssh-agent

  ​          

  After you've checked for existing SSH keys, you can generate a new SSH key to use for authentication, then add it to the ssh-agent.

  ​            [Mac](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#)            [Windows](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#)            [Linux](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#)          

  ## [In this article](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#in-this-article)

  - [Generating a new SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)
  - [Adding your SSH key to the ssh-agent](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent)
  - [Further reading](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#further-reading)

  If you don't already have an SSH key, you must [generate a new SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key). If you're unsure whether you already have an SSH key, check for [existing keys](https://docs.github.com/en/articles/checking-for-existing-ssh-keys).

  If you don't want to reenter your passphrase every time you use your SSH key, you can [add your key to the SSH agent](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent), which manages your SSH keys and remembers your passphrase.

  ### [Generating a new SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)

  1. Open Terminal.

  2. Paste the text below, substituting in your GitHub email address.

     ```shell
     $ ssh-keygen -t ed25519 -C "your_email@example.com"
     ```

     **Note:** If you are using a legacy system that doesn't support the Ed25519 algorithm, use:

     ```shell
     $ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
     ```

        This creates a new ssh key, using the provided email as a label.

     ```shell
     > Generating public/private ed25519 key pair.
     ```

  3. When you're prompted to "Enter a file in which to save the key," press Enter. This accepts the default file location.

     ```shell
     > Enter a file in which to save the key (/home/you/.ssh/id_ed25519): [Press enter]
     ```

  4. At the prompt, type a secure passphrase. For more information, see ["Working with SSH key passphrases"](https://docs.github.com/en/articles/working-with-ssh-key-passphrases).

     ```shell
     > Enter passphrase (empty for no passphrase): [Type a passphrase]
     > Enter same passphrase again: [Type passphrase again]
     ```

  ### [Adding your SSH key to the ssh-agent](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent)

  Before adding a new SSH key to the ssh-agent to manage your keys, you should have [checked for existing SSH keys](https://docs.github.com/en/articles/checking-for-existing-ssh-keys) and [generated a new SSH key](https://docs.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key). 

  1. Start the ssh-agent in the background.

     ```shell
     $ eval "$(ssh-agent -s)"
     > Agent pid 59566
     ```

  2. Add your SSH private key to the ssh-agent. If you created your key  with a different name, or if you are adding an existing key that has a  different name, replace *id_ed25519* in the command with the name of your private key file.

     ```shell
     $ ssh-add ~/.ssh/id_ed25519
     ```

  3. [Add the SSH key to your GitHub account](https://docs.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account).

  ### [Further reading](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#further-reading)

  - "[About SSH](https://docs.github.com/en/articles/about-ssh)"
  - "[Working with SSH key passphrases](https://docs.github.com/en/articles/working-with-ssh-key-passphrases)"
  - "[Authorizing an SSH key for use with SAML single sign-on](https://docs.github.com/en/articles/authorizing-an-ssh-key-for-use-with-saml-single-sign-on)"

  ​          

  ##     Did this doc help you?  

  ​    [Privacy policy](https://docs.github.com/github/site-policy/github-privacy-statement)  

  ​        

    

  ​          

  ## Help us make these docs great!

  All GitHub docs are open source. See something that's wrong or unclear? Submit a pull request.

  Or, [learn how to contribute.](