# Copyright 2010-2022 Google LLC
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Helper macro to compile and test code samples."""

def code_sample_cc(name):
  native.cc_binary(
      name = name,
      srcs = [name + ".cc"],
      deps = [
        "//ortools/base",
        "//ortools/constraint_solver:cp",
        "//ortools/constraint_solver:routing",
        "//ortools/constraint_solver:routing_enums_cc_proto",
        "//ortools/constraint_solver:routing_flags",
      ],
  )

  native.cc_test(
      name = name+"_test",
      size = "small",
      srcs = [name + ".cc"],
      deps = [
        ":"+name,
        "//ortools/base",
        "//ortools/constraint_solver:cp",
        "//ortools/constraint_solver:routing",
        "//ortools/constraint_solver:routing_enums_cc_proto",
        "//ortools/constraint_solver:routing_flags",
      ],
  )

