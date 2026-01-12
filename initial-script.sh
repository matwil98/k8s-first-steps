#!/bin/bash

alias k=kubectl
k create namespace ns-a
k create namespace ns-b
k get namespaces -o wide