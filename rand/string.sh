#!/bin/bash

tr -dc 'a-zA-Z0-9!@#$%^&*()-_=+[]{}|;:,.<>?/' < /dev/urandom | head -c 128
