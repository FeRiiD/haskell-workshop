

hellogen pre post = pre ++ "\"Hello World!\"" ++ post

hellocpp = hellogen "#include <iostream>\n\nint main(int argc, char** argv){\n\tstd::cout << " " << std::endl;\n}"

hellojava = hellogen "package hello;\n\npublic class Hello {\n\tpublic static void main(String[] args) {\n\t\tSystem.out.println(" ");\n\t}\n}"

hellosh = hellogen "#!/bin/sh\n\necho " ""

hello lang = case lang of
                  "c++" -> hellocpp
                  "java" -> hellojava
                  "sh" -> hellosh
                  _ -> (hellosh)
