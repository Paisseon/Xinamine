import Darwin

@main
struct Xinamine {
    static func main() {
        setuid(0)
        setgid(0)
        
        guard access("/var/LIY", F_OK) != 0 else {
            return
        }
        
        rmdir("/var/lib")
        mkdir("/var/jb/User/Library", S_IRWXU | S_IRWXG | S_IRWXO)
        
        let symlinks: [(String, String)] = [
            ("/var/jb/usr/lib", "/var/lib"),
            ("/var/jb/usr/lib", "/var/Lib"),
            ("/var/jb/Library/dpkg", "/var/lib/dpkg"),
            ("/var/jb/usr/libexec", "/var/libexec"),
            ("/var/jb/System", "/var/sy"),
            ("/var/jb/Library", "/var/LIY"),
            ("/var/jb/usr/bin", "/var/bin"),
            ("/var/jb/usr/sbin", "/var/sbin"),
            ("/var/jb/usr/cache", "/var/cache"),
            ("/var/jb/usr/local", "/var/local"),
            ("/var/jb/usr/share", "/var/share"),
            ("/var/jb/etc", "/var/etc"),
            ("/var/jb/etc/dpkg", "/var/dpkg"),
            ("/var/jb/etc/alternatives", "/var/alternatives"),
            ("/var/jb/Applications", "/var/jb/Xapps"),
            ("/var/jb/var/mobile/Library", "/var/jb/UsrLb"),
            ("/var/jb/usr/bin/bash", "/var/bash")
        ]
        
        _ = symlinks.map { symlink($0.0, $0.1) }
    }
}
