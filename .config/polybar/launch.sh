#!/usr/bin/env bash

killall -q polybar

polybar --reload --quiet top
