# PricePredictor
This is a repository for using CoreML, SKLearn to predict house prices based on crime rate and number of bedrooms

To run model:
python coreML.py

NOTE: You will need Python 2.7 installed. CoreML (to my knowledge) doesn't support Python 3.

This trains the model, and saves it. By saving it a .mlmodel is produced.
This repository already has a model in it so this step is not nessesary.

If you have jupyter install you can run the .ipynb to run the python code in a Jupyter Notebook
Command:
jupyter notebook

This starts a jupyter server which gives you a link you can browse to with your favorite web browser.
Click on the 'CoreML-Demo.ipynb' file and use the shift-enter key combination to run each cell in the notebook.
After you run the second cell you might see an "error" message. There is no cause for concern, the message is just stating that 
an old version of one of the dependecies is broken, and it is using a different dependency.

Note: Since there is already a .mlmodel file in this repo run either the .py file or the notebook will over write the .mlmodel file
already in the repo(I think). If you want to run your own instance of the model in the xcode project, you could delete the .mlmodel in the project 
repo now and run eith the .py file or the notebook to get your own.

Also, if you get any messages about how a certain module can't be found you will have to install them via pip.

pip install <module-name> 

For example:
pip install numpy

this will install the panads module locally

