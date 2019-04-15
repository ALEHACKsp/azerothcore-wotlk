@echo off
FOR %%A IN ("*.sql") DO (
		echo Processing %%A file...
		"D:\phpstudy\PHPTutorial\MySQL\bin\mysql" --user=root --password=a4501150 acore_world < %%A
)
