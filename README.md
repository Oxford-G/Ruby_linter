![](https://img.shields.io/badge/Microverse-blueviolet)

# Ruby_linter
- An easily extendable ruby linter that provides feedback about errors or warnings in code.

# The Build
The custom Ruby linter currently checks/detects for the following errors/warnings.
- check for trailing spaces
- check for missing/unexpected tags i.e. '( )', '[ ]', and '{ }'
- check missing/unexpected end

> Below are demonstrations of good and bad code for the above cases. I will use the pipe '|' symbol to indicate cursor position where necessary.

## Trailing spaces
> note where the cursor(|) is on the bad code 
~~~ruby
# Good Code

class Test
  def yell_greeting(string)
    @string = string
  end
end

# Bad Code

class Ticket
  def yell_greeting(string)  |
    @string = string
  end
end
~~~

## Missing/Unexpected Tag
~~~ruby
# Good Code

class Test
  def yell_greeting(string)
    @string = string
  end
end

# Bad Code

class Ticket
  def yell_greeting(string
    @string = string
  end
end
~~~

## Missing/unexpected end
~~~ruby
# Good Code

class Test
  def yell_greeting(string)
    @string = string
  end
end

# Bad Code

class Ticket
  def yell_greeting(string)
    @string = string
end
~~~

## Built With
- Ruby
- RSpec for Ruby Testing

## Designed With
- Ruby
- Git
- Rubocop
- VS Code
- Repl.it

## Getting Started

**This is an example of how you may give instructions on setting up your project locally.**
**Modify this file to match your project, remove sections that don't apply. For example: delete the testing section if the currect project doesn't require testing.**


To get a local copy up and running follow these simple example steps.

- On the project GitHub page, navigate to the main page of the repository [this page](https://github.com/Oxford-G/Ruby_linter).
- Under the repository name, locate and click on a green button named `Code`.
- Copy the project URL as displayed.
- If you're running Windows Operating System, open your command prompt. On Linux, Open your terminal.
- Change the current working directory to the location where you want the cloned directory to be made. Leave as it is if the current location is where you want the project to be.
- Type `git clone`, and then paste the URL you copied in Step 3.<br>
  `$ git clone git@github.com:Oxford-G/Ruby_linter.git` <em>Press Enter key</em><br>
- Press Enter. Your local copy will be created.

Please Note that you must have github installed on your PC, this can be done [here](https://gist.github.com/derhuerst/1b15ff4652a867391f03).

**To check for errors on a file:** 

~~~bash
$ bin/main test.rb
~~~

## Testing

To test the code, run `rspec` from root of the folder using terminal.
Note: `test.rb` has been excluded from rubocop checks to allow RSpec testing without interfering with Gitflow actions

> Rspec is used for the test, to install the gem file, run

~~~bash
$ bundle install 
~~~

> But before that, make sure you have **bundler** installed on your system, else run

~~~bash
$ gem install bundler 
~~~

> or you simply install the the following directly using 

~~~bash
$ gem install rspec 
~~~

~~~bash
$ gem install colorize 
~~~

# Author

👤  **Enekwechi Chinonso Gerald**


- GitHub: [@OXFORD-G](https://github.com/OXFORD-G)
- Twitter: [@OXFORD2](https://twitter.com/OXFORD2)
- Linkdin: [Linkdin](https://linkedin.com/in/chinonso-enekwechi-a96954193)

## Show your support

Give a  ⭐️ if you like this project!

## 📝 License

This project is [MIT](https://choosealicense.com/licenses/mit/) licensed.
