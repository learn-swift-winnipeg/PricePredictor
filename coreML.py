import coremltools
import pandas as pd
from sklearn import datasets, linear_model
from sklearn.externals import joblib

# Load Data
boston = datasets.load_boston()

#Convert Dataset to pandas dataframe
df = pd.DataFrame(boston.data)
df.columns = boston.feature_names

#Drop the columns we don't care about
X = df.drop(df.columns[[1,2,3,4,6,7,8,9,10,11,12]], axis=1)
Y = boston.target

model = linear_model.LinearRegression()
model.fit(X, Y)

#Coefficients
model.intercept_
model.coef_

coreml_model = coremltools.converters.sklearn.convert(model,
 input_features=["crime", "rooms"],
 output_feature_names="price")

coreml_model.save("BostonPricer.mlmodel")
# Error message can be ignored
