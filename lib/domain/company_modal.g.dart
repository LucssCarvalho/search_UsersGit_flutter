// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    login: json['login'] as String,
    id: json['id'] as int,
    nodeId: json['node_id'] as String,
    url: json['url'] as String,
    reposUrl: json['repos_url'] as String,
    eventsUrl: json['events_url'] as String,
    hooksUrl: json['hooks_url'] as String,
    issuesUrl: json['issues_url'] as String,
    membersUrl: json['members_url'] as String,
    publicMembersUrl: json['public_members_url'] as String,
    avatarUrl: json['avatar_url'] as String,
    description: json['description'] as String,
    name: json['name'] as String,
    company: json['company'] as String,
    blog: json['blog'] as String,
    location: json['location'] as String,
    email: json['email'] as String,
    isVerified: json['is_verified'] as bool,
    hasOrganizationProjects: json['has_organization_projects'] as bool,
    hasRepositoryProjects: json['has_repository_projects'] as bool,
    publicRepos: json['public_repos'] as int,
    publicGists: json['public_gists'] as int,
    followers: json['followers'] as int,
    following: json['following'] as int,
    htmlUrl: json['html_url'] as String,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.nodeId,
      'url': instance.url,
      'repos_url': instance.reposUrl,
      'events_url': instance.eventsUrl,
      'hooks_url': instance.hooksUrl,
      'issues_url': instance.issuesUrl,
      'members_url': instance.membersUrl,
      'public_members_url': instance.publicMembersUrl,
      'avatar_url': instance.avatarUrl,
      'description': instance.description,
      'name': instance.name,
      'company': instance.company,
      'blog': instance.blog,
      'location': instance.location,
      'email': instance.email,
      'is_verified': instance.isVerified,
      'has_organization_projects': instance.hasOrganizationProjects,
      'has_repository_projects': instance.hasRepositoryProjects,
      'public_repos': instance.publicRepos,
      'public_gists': instance.publicGists,
      'followers': instance.followers,
      'following': instance.following,
      'html_url': instance.htmlUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'type': instance.type,
    };
