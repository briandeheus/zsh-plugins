_get_gcp_accounts() {

    res=$(gcloud auth list --format="value(account)")
    for i in $res; do
        COMPREPLY+=("$i")
    done

}

_get_gcp_projects() {

    res=$(gcloud projects list --format="value(projectId)")
    for i in $res; do
        COMPREPLY+=("$i")
    done

}

googlesu() {
    gcloud config set account "$1"
}

googlesp() {
    gcloud config set project "$1"
}

complete -o default -F _get_gcp_accounts googlesu
complete -o default -F _get_gcp_projects googlesp
