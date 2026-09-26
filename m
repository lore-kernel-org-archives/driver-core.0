Received: from mail-vs2-f28.google.com (mail-vs2-f28.google.com [74.125.227.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9971E46C4B4
	for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 14:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431764; cv=none; b=QLY1B0bfNBPZFTC2shiuFSWpP0OZZJvgTVW3EH0BI5s/7ktRGI2Zey4n/2RpwZSG3x1yHDRupT9D248jo9ojVJH5sNECqEeATaOHWhE/JdosDPwN1bX8YHrV4JgpGKYO+7NoqE92JZiGlOJodlHDXizDgeHvjof/1B3CtWYztiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431764; c=relaxed/simple;
	bh=etrwk1jj7vbSnyTTqgF9FfjwDx8vHLxlRGzyAJzKVjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QP0sEbtb7PSXAOpcJBUnejmQ9A6zjTXBNsV12GDZIQboKC0HqCaCkvkk8TB/7Zos34y3BJM6EfKRFnMlFxNlvh+CeeEWgoA01ZvCGE2XmegDQgKFZ7dS4IfHH4qs2wUDLicQMiXXF+P/jTNiLdFL2P8/z8rCCzjveywqiqXSX8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIk2vtwX; arc=none smtp.client-ip=74.125.227.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIk2vtwX"
Received: by mail-vs2-f28.google.com with SMTP id 71dfb90a1353d-5c9031e714dso590812e0c.3
        for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 07:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790431758; x=1791036558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vc1otBls11wsX+j5VdMpDkxyMmYSz8SI4nun8FL9hPM=;
        b=JIk2vtwXpJfy+EIHaxL66xWh2NqQbz8xJQDGsdlCxd9n2P4KqSt5hHDQeon2kQJ53x
         nu+d/pgE1cYbiTyyxHozSD48a96ktkeOKft+QnbXe8BjD81MeSZKh0KJtHBuJXJGbYtY
         HCDMaF7vLgqQq6QI5G0soylTVOhU8k8uAjB+by86ReSV5F/r9F8wilqR27uIPKFMVadv
         P0Jf3PkdIV8TYntKN+8RgW2DRzSXn8qjUHy6butjrTjKZgN8E2dT56407pzTnT1WATMe
         GKgQ0Fo233d49wPQGX3JdOheXpXFDP5nR/khL7UU8QLIb0duhnVQaGH5+XrwxkQndsLx
         LDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790431758; x=1791036558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vc1otBls11wsX+j5VdMpDkxyMmYSz8SI4nun8FL9hPM=;
        b=UhpS28snjeVKVXjPfEkVRca4htusHBUW+G6misKHId7rSPvswuF9wUyBaNTFD1Kj+l
         mHPyEM/B/Y+3fQPu+FGtnbnCpmxG+m922Ba70v3DsUhJc9wytNfXnbQwUIokq2XdTQmz
         vMtjadPd6dzSReNdxH+otArbvgl5oByb3DlCpVHShKhM9JzBq848W+mR5zArBplKse1I
         IisESZoeYEU8CxaLljDAm4jlMnwrqpAYrApAlU8oWiGcxz9yO4R6vnZdp2OCoUBdTQeP
         hSgl/rmMLYtLY5fzMhwIlwxR+lnT+1CUWjny8j7VjS9hd0CgEfRn/ublOsLoBHMBUU29
         WJKw==
X-Gm-Message-State: AFuF++kpRZnIfJ5oIEKisX7PmOOtFNICLgJ2AxQShYd7KmobarkKqBfW
	Q/efIMtVqFB90dltUWBlAez9PwGNjEzMFKhgD/9I5tT9XjFo87ylPDXj
X-Gm-Gg: AYBFou05/GMJr8wqLIJEPDWu3sK6LZt8TDUakGvm8qpxNT55B1Ylx1iEziYFV8xBIt1
	s669du6Jmceo3LBOoa8nLmQGyLXIOYENjQfUs/a1iz5d+1/XOr2eVpDwczpdIE2FtXEWwQJb2q1
	4lwMC6+KIea9GCpmV/N71Jy46HiY7iyUsu40KQzu/mfiQw2nfTRwPOK+ROcnYVE8e/v/JHK5gTa
	JXhZyfWWGMqaUv0h0GjNAy68qmU2xBNzB8xD0fyRsOYEmnZiDIcvLajkLihZ9VoXRZTZYTqSg1d
	Ai9ohovfw6aqNAYgxpw8I1zHecFkAMGHxGvOJdAAkiQJ/V1XHeKJYl+/rudRM9Gbr8BDA+W+fpb
	gEeHH9TR51St7AyCcgWBHfKYdhnBZ+uBb+wZmpl/2Kamp81QPrJdsMY+uUKBUi6GMSUlt/Pc2Cl
	QS5uZi4i2m2WZYqKIxp33i0eD8DPUyJmn5xbgJmho8Ktjr5L3wQdy2IEfoQ/Sm2+Q=
X-Received: by 2002:a05:6102:504d:b0:7a6:85d6:8ae0 with SMTP id ada2fe7eead31-7b1c4a2eae5mr1332435137.1.1790431757711;
        Sat, 26 Sep 2026 07:09:17 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b159055sm2319867137.3.2026.09.26.07.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 07:09:17 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v3 0/2] debugfs: fix UAF and double-free in debugfs_str read/write
Date: Sat, 26 Sep 2026 11:09:03 -0300
Message-ID: <20260926140903.1077151-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092647-ebony-unlatch-d3d0@gregkh>
References: <2026092647-ebony-unlatch-d3d0@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3: regenerate patches with git format-patch against current mainline
    (v2 Failed to apply due to an incorrect manual edit.).
    No code changes from v2.

v2: split into two patches, add Assisted-by tag, include KASAN splat.
    https://lore.kernel.org/driver-core/

v1: https://lore.kernel.org/driver-core/20260925175831.3701812-1-qwe.aldo@gmail.com/

Aldo Ariel Panzardo (2):
  debugfs: fix use-after-free in debugfs_read_file_str()
  debugfs: serialize concurrent writers in debugfs_write_file_str()

 fs/debugfs/file.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

--
2.43.0

