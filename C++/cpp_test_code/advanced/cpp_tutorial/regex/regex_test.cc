/*
*
*      Filename: test_hhb.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-13 15:49:54
* Last Modified: 2017-08-13 15:49:54
**/
#include <dirent.h>
#include <stdio.h>
#include <iostream>
#include <regex>
#include <string>
//#include <boost/regex.hpp>

// std::regex version
// require GCC version >= 4.9.0
// compile: g++ regex_test.cpp -std=c++11
std::vector<std::string> ls_dir(const std::string& dname,
                                const std::regex& match) {
  std::vector<std::string> files;
  struct dirent* entry;
  DIR* dir = opendir(dname.c_str());
  if (dir == NULL) {
    return files;
  }

  std::cout << "open dir success" << std::endl;
  while ((entry = readdir(dir)) != NULL) {
    std::string fname = (entry->d_name);
    std::cout << "files " << fname << std::endl;
    if (fname != "." && fname != "..") {
      if (std::regex_match(fname, match)) {
        files.push_back(fname);
      }
    }
  }
}
int main() {
  std::vector<std::string> files =
      ls_dir("/sys/class/drm", std::regex("card\\d+"));
  // std::vector<std::string> files =
  // ls_dir("/home/hhb/work/learn/test/advanced/cpp_tutorial/regex/test",boost::regex("card\\d+"));
  for (std::string cardname : files) {
    std::cout << cardname << std::endl;
  }
  return 0;
}
