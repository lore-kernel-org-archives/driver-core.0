Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391417;
	b=Ezh9sQhDQ09ViGGEEiu3+G0qTjQoWD/KPDLNwyJv9hTIuBCSQcJwf1pzFWYnBXvJQdWL
	 YBQUcnE+8DOiJQC6CJ3cl4ErwWyPLKzsTVMY9mr1v+l37WWzx23CqdmoXeDQM6eq3J2P7
	 mieW9jE8HU/Ok0MhnNaKUrOOPUXp6qV/fnf0cqSrtIi0PX1ZVW7ZTgiuKqDt7YZi+YfAj
	 nvmhFVNsHfqypBME4E2cPkX8KMGh4TdTjqnjHP+3atKtamJjDscL038fPoDZ9QP3aljmm
	 MSvsBApbTAOi+OgXStjvSl7kKRevaWXwKr0gI+0koXjs/JYogWrdnPwbqsYD/1fww8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391417;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fzTeJCVHzcB8Z/KqDqXf1rzno0vkpiPSSG6MgmyFSgo=;
	b=3TBC9AS+dayf46MCCRUQ+CJ3DELJv2WXgF0OZCcKKdUte5xNhmTw3Z4HQCk7XVtloD7U
	 w3FCd+e/x4n7aWjFhGzjc9XUuf3K1NkGTcUaZL+uOK84G/885kYJ7Sj9KvJ9scxLWmUqR
	 uAtUJU+Qs21/ZypUPr89LA1PiU7i4zDU2dfpiKGcaq4OZ4idPdQrdwW+WIaNZTKsMjBuM
	 6ze7kC7hEQw3SCwe0kJ/TgnobpPFPjDXPvfhkhIDwFjkYlJ+SXGr/3iRZQqZNHEAzTkHw
	 Ni2fidH14mMam0nVB83dC0LwcJwf7d54z58HsUW2UorUu9NU+6OXeHEo9bVL7a9lsNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ouehZIx/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAFF606A32E
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 10:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ouehZIx/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B05D1F00A09;
	Wed, 11 Nov 2026 10:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391417;
	bh=fzTeJCVHzcB8Z/KqDqXf1rzno0vkpiPSSG6MgmyFSgo=;
	h=From:To:Cc:Subject:Date;
	b=ouehZIx/iBnR05QiFUvoU0qKW7opoD8mC1/G6VwQO3p97dYssyFWq3pRBUFS2upDC
	 wU0BQx6HY1vPjZohnXfX+sQLKXo/PgS8N+1cubIDS9KZ2RlFBPFlelyYbq9XGYhdzt
	 K1Sd35L/tEFD+4IpfLZBCqn22QA0vNgBYbFFDA8M2zzusQp/riNH/hdiE/ikLCI0Zr
	 UIxFDvPdV8gp70d059tztjdkTkRV/ju71K6j1ThU/c2fJtbeNZb2KYtN4e9ev0rbDy
	 OLO9vL8gisqdR0n0ON7veI+qmOHU9aV8j8MZCFjpHk+G/QYA/vK/H4zpLHxsEaG+2M
	 8n/WH8TZjZvSg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 0/4] arch_topology: Bunch of error patch related fixes
Date: Wed, 11 Nov 2026 10:03:27 +0000
Message-ID: <20261111100331.2945297-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Hopefully no more issues get reported by sashiko. It all started with
one issue[1] one patch and ended with 4 different issues so far. All of
them are related to error path handling.

v3->v4:
 - Validate all possible CPUs before normalizing capacities
 - v3: https://lore.kernel.org/all/20261109173125.1734847-1-sudeep.holla@kernel.org

v2->v3:
- Added fixes to couple of more issues pointed by Sashiko
- v2: https://lore.kernel.org/all/20261106164408.158337-1-sudeep.holla@kernel.org

v1->v2:
- Reset max_smt_thread_num to 1 on failure similar to parse_socket()
- Grouped below 2 in one series and posted them together
- v1: https://lore.kernel.org/all/20261104153413.2786066-1-sudeep.holla@kernel.org
- v1: https://lore.kernel.org/all/20261103093421.1283949-1-sudeep.holla@kernel.org

Regards,
Sudeep

[1] https://sashiko.dev/#/bug/linux-73adead8-21f3-470d-938c-b1f07a269a72

Sudeep Holla (4):
  arch_topology: Reset SMT state when socket parsing fails
  arch_topology: Free ACPI SMT entries on lookup failure
  arch_topology: Reset SMT state when topology is unavailable
  arch_topology: Avoid zero CPU capacity on parse failure

 drivers/base/arch_topology.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

-- 
2.43.0

