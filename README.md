# Predictive Modeling of Mice Behavior through Neural Activity: Integrating PCA, Random Forest, and Multi-layer Perceptron Approaches

## Summary
In this project, I began by generating synthetic data that follows a multimodal Gaussian distribution with specified parameters. I then constructed various machine learning models to approximate this multimodal Gaussian distribution, subsequently comparing their accuracies and execution times.


## Setup
This project is developed using R and R Studio. Refer to `mice_project-report.RMD` for the required packages.


## File Descriptions
- Data_Loading.R: An R script dedicated to importing and consolidating the neural data of mice into a singular container.
- Data_Wrangling.R: An R script designed for cleaning and refining the mice neural data.
- mice_project-report.RMD: An RMD file that produces the detailed analysis report for the project.
- mice_project-report.pdf: A PDF version of the project report, derived from the aforementioned RMD file.



## Content
This project includes 7 parts in total, specifically: 
1. Synthesize a multimodal Gaussian distribution
2. Fit a piecewise linear regression model
3. Fit three spline models with 2, 3, and 4 knots respectively
4. Compare the R-squared values and root mean square deviations (RMSD) of the models from the previous sections
5. Fit four polynomial models with degree 2,3,4,5 respectively
6. Compare the fitting times of the constructed models
7. Construct two polynomial models of degree 5 using Lasso and Ridge regularization techniques

### For inquiries or further discussion, please reach out to me at [xihaocao@163.com](mailto:xihaocao@163.com). Thank you!
