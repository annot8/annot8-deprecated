# Annot8 repository setup

This set of scripts will help build a standard looking annot8 repository which wil:

* Use Travis CI for build
* Use Coveralls for code coverage monitoring
* Use SonarQube for code quality checks
* Will deploy the artifacts to packagecloud Maven repos
* Send notification to slack on builds

PRs will be cehcked using the above tool. Master will be deployed on push (ie when PRs are merged).

In addition a Git hook is added to pre-commit to perform code cleanup (using Maven spotless).

## Assumptions

If you are trying to use the ANnot8 organisation's infrastructure you'll need access ot the various keys / API tokens.

## Starting

Create a new GitHub repository, we'll call here `annot8/new-repo`.

Visit travis and enable the build for `annot8/new-repo`.

In travis you should add an environment variable:

* PACKAGECLOUD_API_TOKEN with the API token from PackageCloud.

Visit coveralls and enable the build for `annot8/new-repo`.

```
git clone annot8/new-repo
```

We'll assume this has been output to path `/path/to/annot8/new-repo`.

From the directory of this repo run

```
./setup-new-repo.sh /path/to/annot8/new-repo
```

You will be prompted for the Slack Token and the SonarQube Annot8 token. Also you will need the `travis` command installed.  

Once this has finished you should review the commit (and any uncommitted changes). Then push to GitHub and merge as a Pull Request.

Note that you will have to add to your POM (in order to find `annot8-parent` snapshots):

```xml
  <profiles>
    <profile>
      <id>travis</id>
      <repositories>
        <repository>
          <id>packagecloud-annot8</id>
          <url>https://packagecloud.io/committed/annot8/maven2</url>
          <releases>
            <!-- Don't look for releases, use Central -->
            <enabled>false</enabled>
          </releases>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </repository>
      </repositories>
    </profile>
  </profiles>
```

## Configure the repo in GitHub

Once this is setup you should configure the repository in GitHub.

Note this are recommended for Annot8 organisations, but not essential.

* Add link in readme to Travis and Coverall coverage 

In Settings>  Collobroators and teams, add Teams:

* Developers with Write access
* admin with Admin access

In Settings > Branches

* Default branch is master

with Branch proection rules for master:

* Require status checks to pass before merging
* Select Travis, SonarCloud, Coveralls as required
* Include administrators
* Restrict who can push to matching branches

You may which to set require pull request reviews before merging. This is very senisble on API / common projects where changes have a large impact, and are less frequent.

In Settings > Webhooks you should see coveralls and Travis (assuming all is setup correctly).

Integrations and sevices will list Slack.

## Other items

In Slack, under the #git channel:

```
/github subscribe annot8/new-repo
```

