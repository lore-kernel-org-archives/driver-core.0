Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822182;
	b=eCPyX2iVgykRLXK6IEu9j/UmouX8E7KZQiDHBEBbrkiQHRAMK/fM3M3nzziWECuB6j+w
	 3dMz8tvZKSsQ1wVm3KJgrtVNYMbuloNUdNQ8gzbsIZXtSadCVPOa1ED8n26TRVUm8SHXT
	 m7lbIY0ujvawsjmIzCLL3fqld9zuMml+WwMXlxb1635uK5Ab0jyB1Xy2S1RHYxLfUgDEv
	 3gwF0haVWbfIsftOrWSiuvhBbIdDuRdkAgpMrxZPqEUkb+VGevsPhceL273dfXRIxRuew
	 bUu2SF6QxlvTm+DhWRtjkV+O+aMRv4yd64hz8d94dm/PxMopXPd3ewyNNyrkTXuX/uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=P08dLrh12a79aELYRdwJhJM6sHf6xDuxFDQdAiXSC4A=;
	b=T5FrFYAEUQR0sz4bFzPPRnujhYpI1waxCm5oEBauqHfW7z234sEhYDpDzkZ/JR7MxQ4p
	 sd0Xf3cj3stXk8RxqnmwRBA9CStf6PMguyqJRVsqFVMcxTVqJ6x/Br10c1ubID3OMU+1H
	 JKrpDwgtXTiN0nekh8+4+ByAjOgsmrkXjCglfpRdF20TmfWCIoaX+aW0O/cM5MjOTmShb
	 F9SXdFfdOe7hvrCJ5udl6XT1ZyuOFVgvrcZbsxq0NCL+5IW8RsYHGSbMAsSM3jF51bu50
	 VFBt7C0DEeoMSyUhNgYcR9FxwoBgsJqSw2NwTiJ1GUia0RhHEysO5jwP5l686J+m91g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzaV0tuJ;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39136606A329
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 09:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39136606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzaV0tuJ
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so1321321b3a.1
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 01:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822181; x=1795426981; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P08dLrh12a79aELYRdwJhJM6sHf6xDuxFDQdAiXSC4A=;
        b=dzaV0tuJtrfls8Fl3nKWxxVOGlQkHThjaFcg7q/oE442gPwLGQfO0Cd0UKDKXrVLTP
         mFqxPthqSEttql3hvfAkxfXhsRyr5uLKQXL2zyxOjXwMa3p2LwoZwgNV5aljvaRGDAtZ
         pT+IaIQ5Wg4i3ELUPQbbuOc3qoNzpjOl0n31T3bGhtGeZ1u6ONKpFb7K0fAQVk+TwrBP
         ldK+AIdk+yGyffJqsuh0TFTuNm/+aCeCCizqJBPoTOkNBA7bPwAxDNPiM+PO6sPef+U0
         g8vG4wCh5UFoEoDf8Xtuai3pHwP9QNRmzP2Q4fjG0VIogYpfRpwvz96hQmBzDdR1I+IA
         6PHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822181; x=1795426981;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P08dLrh12a79aELYRdwJhJM6sHf6xDuxFDQdAiXSC4A=;
        b=DJRcU8ainRRN84WQm/GoM7Bqgp1GpSctVncZ8sQNyF4eIqikrrtejJGxXBNx0nDTYs
         JedGg0NkflP9osqE8AXrSLHeRZvLFjT0Uaz3TspTVzGK7kSTvgeUMWWdsELf/8WGURG1
         mybavUZ4XP1c6COIl0mI8Ixu/sokszMZPe46AQnytA6yKf87ueNG6j3UFvtlBxEfPQJl
         nzgPIsyj6VKV7i61MQDt14NyScaSpcWQ7naAa/oeBe4uODqKD7B4uabxQ4yKCBaH3+wg
         nTJdorVv58/X/Of/GMvL9IxSWtgYijIlnCmRPAO165Rs+RHThGencY28l4uN6gLFUbtR
         mzOA==
X-Gm-Message-State: APuU4Z8nryjoj8pPFAYlpnJCBLCP+qOreOTElEe/SnrEH53qqUOsPy1V
	P0WVZZnx6S7fyCXBL7jN6hk+uExdt8pDuD6TUJdjeuFKzltteKxRe3Yj
X-Gm-Gg: AYBFou0LjIt8OHabFlrd0OCiKJ6S5ez9z1KRYV36WIFo5VleQfyBAhGE1+ROB6bR4PP
	Kg4eVea/elMG1tsGM/USE3bUGrlaOvOPSFPWkkkWg4QMQo/pbi1KwaQt/FRHah/PR39F1wRIRDy
	0gSj9DPSBiWzCbccU0SBvECEKOtXqoH8CgCpYgaBAk7Z0GCnqmMS1GfCEPIbbyX/+N5rme9Ycux
	wEZxdi3+9KqMmlPHdRDGxFoCtHvgZ+4DY7w1n2VdLMljBuKjq+oKr6+YP8KFQZmd7MIOyAywPzH
	FEePgZnRR5SpMZJhcJpJt3SRhbglKM0zcyi5XARaKFDRhKhm0NIT7yeM3Bzusb0dx94yiD6Y76D
	rsgpVJv0zvAiE7yK1Q7V9x4LMSHtjVm4vB/Dscho/WzQxnpqvYfvmTz3MOY5PfyGqle+yjVheg/
	QbO2eIuOqB4JgjRsft+C4hvoy6EMwv/aWl1d4VtH1fNkNQ6uyYpLSQcxMOyge+fZvLcARg2Luyd
	l29V05q47XLV4K/jPhQifZK5qx44rZ4kSV1WEvuXFdf2i6i/Wghc1913fh0Ip51Z0vy2qlnPqeg
	/2Eq44YW2S80E15VJ1q8pxOSbYaT583SzcinBpy2NI9tAtvuhntoPtoBtY3fQZoLHN15H1xP3sK
	Crszb3V7d0O8Ph00BmA==
X-Received: by 2002:a05:6a00:802:b0:8a0:6417:8f9b with SMTP id d2e1a72fcca58-8bd62be6f46mr8425231b3a.32.1794822181479;
        Mon, 16 Nov 2026 01:43:01 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f133:af41:7614:f46c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a90fdsm3424231b3a.15.2026.11.16.01.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:43:00 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/4] sysfs: support SYSFS_GROUP_INVISIBLE for unnamed
 groups and ownership updates
Date: Mon, 16 Nov 2026 01:42:52 -0800
Message-Id: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABzQ+moC/yXMTQqDMBBA4avIrDuQxD/oVaSLRCc6UqJkalHEu
 xt1+S3e20EoMgm8sx0i/Vl4Cgn6lUE72NATcpcMRplKa12ibOIF+zgtM3K4AvclLIrcWVMr3yk
 LqZ0jeV7vb/N5LIsbqf1dMziOE7UC9GF5AAAA
X-Change-ID: 20261115-sysfs-group-invisible-443ba270fd0a
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Fernando Fernandez Mancera <fmancera@suse.de>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

DEFINE_SYSFS_GROUP_VISIBLE() and DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE()
evaluate the group visibility callback only for the first attribute and
return SYSFS_GROUP_INVISIBLE when the entire group should be hidden.
While internal_create_group() checks for this return value before
creating or updating a named group's subdirectory, it skips that check
for unnamed attribute groups and proceeds directly to create_files(). As
a result, returning SYSFS_GROUP_INVISIBLE for an unnamed group only
skips the first attribute while still creating all remaining regular and
binary attributes, and leaves them behind on sysfs_update_group().

In addition, sysfs_group_change_owner() checks SYSFS_GROUP_INVISIBLE too
late inside sysfs_group_attrs_change_owner(), failing with -ENOENT when
looking up the nonexistent subdirectory of a hidden named group and
falling through to binary attributes when breaking out of the regular
attributes loop. Furthermore, SYSFS_GROUP_INVISIBLE is currently tested
and masked with bitwise operations even though it is a standalone
sentinel value rather than a permission bit.

Switch SYSFS_GROUP_INVISIBLE checks to equality comparisons, and check
group visibility upfront in both sysfs_group_change_owner() and
internal_create_group() for named and unnamed groups alike. Drop the
now-redundant SYSFS_GROUP_INVISIBLE checks from create_files() so that
returning it for attributes after the first one triggers the
invalid-permissions warning, and simplify error cleanup in
create_files().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (4):
      sysfs: check for SYSFS_GROUP_INVISIBLE using equality comparison
      sysfs: check group visibility upfront in sysfs_group_change_owner()
      sysfs: support SYSFS_GROUP_INVISIBLE for unnamed attribute groups
      sysfs: simplify error handling in create_files()

 fs/sysfs/group.c      | 93 ++++++++++++++++++++++++++++-----------------------
 include/linux/sysfs.h | 52 ++++++++++++++++------------
 2 files changed, 81 insertions(+), 64 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261115-sysfs-group-invisible-443ba270fd0a

Thanks.

-- 
Dmitry

