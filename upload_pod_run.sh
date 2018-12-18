a=`grep -E 's.version.*=' VDCommon.podspec`
b=${a#*\'}
version=${b%\'*}
LineNumber=`grep -nE 's.version.*=' VDCommon.podspec | cut -d : -f1`
echo "current version is ${version}, please enter the new version:" #-n用于允许用户在字符串后面立即输入数据，而不是在下一行输入。
read newVersion
# sed -i ".old" "${LineNumber}s/${version}/${newVersion}/g" VDCommon.podspec
sed -i "" "${LineNumber}s/${version}/${newVersion}/g" VDCommon.podspec
echo "git commit and git push origin master ？ (y/n):"
read isCommit
if [[ ${isCommit} = "y" ]]; then
	git add .
	echo "please ender commit info:"
	read commitInfo
	# 先commit再pull后push
	git commit -am ${commitInfo}
	echo "push origin master..."
	git pull origin master
	git push origin master
fi
echo "add tag and push tag..."
git tag ${newVersion}
git push origin master --tags
pod trunk push VDCommon.podspec --allow-warnings