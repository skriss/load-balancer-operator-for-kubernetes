#!/bin/bash

# Copyright (c) 2021 VMware, Inc. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

################################################################################
#
# usage: run-e2e
#
# This scripts triggers end to end tests for AKO Operator against a real
# Nimbus-based testbed
#
################################################################################

set -o errexit  # Exits immediately on unexpected errors (does not bypass traps)
set -o nounset  # Errors if variables are used without first being defined
set -o pipefail # Non-zero exit codes in piped commands causes pipeline to fail
                # with that code

# Change directories to the parent directory of the one in which this script is
# located.
cd "$(dirname "${BASH_SOURCE[0]}")/.."

export PATH=$PATH:$PWD/hack/tools/bin

E2E_ENV_SPEC=${PWD}/e2e/env.json ginkgo -v e2e/... 2>&1 | tee e2e.log
