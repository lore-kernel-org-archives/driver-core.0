Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245489;
	b=gx/f342Io9K/QcxT6N3++tY3SmXzDQkh8FxSdYxPnr4VoI4oLJpVD/8Rj1uoVKz4oXXH
	 5AKCcJsiMnIn0SYK82GqrhVT87FHZyOuhGNB6A8pKLoEgecWZcY5SZQT/mgdJeMbZZtLd
	 zxLu2Eq+aLp114gt41aYbPZtQ2OeiQEI3ZBVPuJev4ElAogshf1tkuVTCIwI5WHJ6l6hm
	 F6w7pDjYyKfVRQDu+A3fRWRFb11htpToI25x3VSpztBHNuji9gNnRkr9ewSpOW98fVvvU
	 drJ0wKjaEHPP5X2GLTQBFtrLkGb+PG/Pou7IQucP+tEihiaSNmI8Gi3x+1e+T9ufRbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245489;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o7pAMmFr+ufYrD8QPsXq104wWGNDe+HQQMRdKZbHGog=;
	b=5WSDboRFTMdQIGtkQMEAcv70TRE09m+EvXJRYh4f4h+fG8CTx5y5XJvI6ThXIsiaTbIa
	 UvyM88OG+27xI+t7QERoYN7mgdNcYym0zu0g0Ht3QmBh3OuMtzB3MJS4M+qDMX5ygq1kG
	 /tAAl5ww9Ml6Q5n9EggYx8Rc1FOBccN734UP4jx1qkfma5CSyvq0YkzP9mMAa0T7AKx8p
	 E9eyxmNLNfBHpKcXEtm99J++IW0AKb7/5Fei1a5aRr99LFR3gXXE7eEwDDWnlsDJRn/FW
	 D+NyP3ssgv3TjfL3HLWAABflTQy7nHHMJf31O4nwtgAKm2CjZO94C1yMU64BV0a/DZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6GElZnf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B513606A332
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 17:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6GElZnf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DBC1F008A1;
	Mon,  9 Nov 2026 17:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794245488;
	bh=o7pAMmFr+ufYrD8QPsXq104wWGNDe+HQQMRdKZbHGog=;
	h=From:To:Cc:Subject:Date;
	b=m6GElZnfk6BX7GMJh/+QQMlWsvHxWPtJvXJf4j/dlQge1QAyjPU/CceCI5rKUI3Yk
	 xgM0jkUfZRgxBVsg3hu891OOu82mNfhTCM5NX8ntL1+rmrwXHTePv803lKnhBG+JrK
	 /YfDyJbCocjSMAUjQtJQqWS5loFrZcyRhhX3/F/g7W1d8LJeaeUOduHSCw+R5Klg+h
	 OiqguryGNilvalmGLUPRr8whiczFJmzeRIKu17TNQXQ3PZzvTuDxcPeicnealyrlC9
	 rlb1z8jvYE+GWgHmHBz3ot32OopFFV3uBxtSPIqa//4L0pa3fThLdVJbLT92ODjN31
	 /b199d/6xtJtQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 0/4] arch_topology: Bunch of error patch related fixes
Date: Mon,  9 Nov 2026 17:31:21 +0000
Message-ID: <20261109173125.1734847-1-sudeep.holla@kernel.org>
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
  arch_topology: Free raw_capacity when topology parsing fails

 drivers/base/arch_topology.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

-- 
2.43.0

