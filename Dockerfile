FROM julia:1.7.2

COPY ./setup.jl /

RUN julia /setup.jl
