=====================================================================================
Welcome to the DireWolf Job Portal

Deployed on VCL @ http://152.46.16.234/

Deployed on EC2 @ http://ec2-54-186-80-176.us-west-2.compute.amazonaws.com:3000/

VCL was giving us lots of problems.  If VCL doesn't work, try EC2.

Details of Users created already;

Admins: 1) shanilpuri@gmail.com => password:1234567x
        2) admin1@test.com => password:1234567x
        3) admin2@test.com => password:1234567x

Employers: 1) employer1@test.com => password:1234567x
           2) employer2@test.com => password:1234567x
           3) employer3@test.com => password:1234567x

Jobseekers: 1) jobseeker1@test.com => password:1234567x
            2) jobseeker2@test.com => password:1234567x
            3) jobseeker3@test.com => password:1234567x

=====================================================================================
Note: Please follow the below steps to setup the application in your local machine:

1. Setup a test directory: mkdir ~/test
2. Clone the repository.
3. Setup your database.yml as shown in 'database.yml.copy'
4. Run the following commands:
    1. bundle install
    2. 'rake db:create'
    3. 'rake db:migrate'
    4. 'rake setup_sample_application'

5. Your application is good to go.
6. Start your sever using: 'rails server'

Enjoy playing with the application. :)
=====================================================================================
