#!/bin/bash

usage(){	cat << EOF
Это справка скрипта task1.sh
Использование: $0 [file(s)] [option(s)]
	Options:
	$0 filename - удаляет пробелы, удаляет пустые строки и заменяет маленькие символы на большие и 
		выводит на экран (без перезаписи исходного файла(ов))
	$0 --help - вывод справки
	$0 filename -w or --write - удаляет пробелы, удаляет пустые строки и заменяет маленькие символы на большие и 
                выводит на экран (и перезаписывает исходный файл(ы))
EOF
}

while [[ $# -gt 0 ]] ; do

	[[ -f $1 || -h $1 ]] && FILES+=($1) && shift && continue

	case  $1 in
			--help)
			usage
			exit 0
		;;
			-w)
			sed -i 's/ //g; /^$/d; s/[a-z]/\U&/g' ${FILES[@]}
			shift
		;;
			--write)
                        sed -i 's/ //g; /^$/d; s/[a-z]/\U&/g' ${FILES[@]}
                        shift
	esac
done

(( ${#FILES[@]} == 0 )) && echo "Файлы не указаны!" && exit 1

sed 's/ //g; /^$/d; s/[a-z]/\U&/g' ${FILES[@]}
