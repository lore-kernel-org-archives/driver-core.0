Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C473C4572
	for <driver-core@lists.linux.dev>; Fri, 28 Aug 2026 05:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896204; cv=pass; b=joe76fg6k7osaZ3TJ0B+nzBn1SbU0LsL8wn4E4nuBlWkn5rJPjfgPGtm3i59UvfEMIh5WmyO9jvb0M4ZLo18kcIRHNUb7mYzy8aFUq/E+V9NipJS6Vc2420lw3tq3Wb9CR9v11RNE1WdmuuwybMqxazEX9b3zSxqtArBG2/lb5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896204; c=relaxed/simple;
	bh=Jio7sO4pCEGq3rVPHZZ84dICs7hxJu4+ln/FH4TXjhI=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=ahpvt8K/L5XYVN3JFVacHL3TYJgKMCvx5Ld8kWV2x3w1Yh3WhSrMcTwqeR1OfzlQWTE0YJrX01URPn6yQ9Yx7kJNS18+9adotdE24hikdVcle51LKY0C0VZ9bUXtSzfG5LcDyomSSABi3s2fZL+ZyKFjvEh4bxviYdueUmKjCb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=c7Lr8BwS; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="c7Lr8BwS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso825716a91.3
        for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 22:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787896202; cv=none;
        d=google.com; s=arc-20260327;
        b=LYy33kDLcCHHYU6q3WyaIMYD7WvJDs/8zX85K//0fwyss7YFqeTwpfm/ZJyJjv0Dl3
         /tAmZCF+hnmhCLYHHXdmFvzvptA1g2S00tqhhp9AE3br8PTffMD5feysPH9YX6Ry2nWi
         +eBjuZlIJAPQ3L+1gJf3eeeMIWg9XCQ6xuSN47lKf0ahoasGwbF8otR56LuvrJgd9pnP
         9VcopPxTeNoYZxz8l45IYtjkl/yusHIVf9ckD72GprFgEis5kCaeN4n6c9+m6g20dK72
         zNigBc7x/5RNMxmXIllEQKuRhftKM6vg2ZFIt/CYOSseZVLbLl7j3Q7yIeCSK7LgQMCN
         2oDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=vAOGoOHxM3mKR4qJD3BaTZbqRLt/kDWX0QIIW8aFtCo=;
        fh=BocFyrdNfltIn2e4i9SXvJIyxiUNPSZtRjrNe8n/L/Y=;
        b=ovmfSsMAFPG7RTo1HWXpEUEWpkxLwO55efNuxyVqSvrz8QEW/9mANMwXAmAZgd5cGS
         0rPb2xu/3OcGs9beGGCKgZ4ptTQUyg0OyE3DQx9lCA00MLiID7BrW6LX8zDMxexyZmeI
         VUcnZXwDzxDcWTM3x8EODBySGnULDSzsiaPY4tcigv0gxiIvTIQRuwCoMjYQPZDB0Us3
         hq9V1lO/2UbpU9MVnh45CIP0Ne4HUa3XpbSj59kAH8qlgKUSO85D0rekcdXHGo00f9/6
         hMteNZwH35cv1TO7mwAYD2HvNR7j5SUHqFQ+giFQ4AAg1XR1GCpbONrj5H/X/JwWrHYT
         BJqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787896202; x=1788501002; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vAOGoOHxM3mKR4qJD3BaTZbqRLt/kDWX0QIIW8aFtCo=;
        b=c7Lr8BwSf6GKwGtLeVjGX2YFaD9yA9OAYJVGKFe//8rnHD0hVMWm9HNDz2Oe/mAme2
         9p5V+GoxuhcQ+g4HotatokPHM12xLByx4+GcWFCkxVEXfjNwO42aG4PfW5fEP7Ar4lVI
         +0FNJ0vJRRD0WwRsIaws7s0Erx0Ml/QGeUXR8Fcoht+OKBb5JniLG8R5FO7vulRXJRwx
         nbRs5Nn2vCvEAK5FlIJ8SIFhX/jVW6DO/fIcwxNHvKfB49TAEw2Ikw9giDcmDhzApt5X
         K8eCn5dxpqmIh+2zzOgUHnd8fqcmgtJrXTXJMMR39UX8AuJyw54paC/OIpDBg+3Al8RN
         I0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896202; x=1788501002;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vAOGoOHxM3mKR4qJD3BaTZbqRLt/kDWX0QIIW8aFtCo=;
        b=n9ZD9XoZu2zGhthURJY19dAu+3x7T/DHbbnOGsrkVHPd9P1FZZy8zIvpNPei+hogff
         v0uUp6f1sBM+NHHgHrNfly8gwqjUwTY4WPJgdAE0PzrpHsixgSbVCOU5/HGsL3nbgMKF
         sTl/foALzQH5Kca1kIoiM46YCPLePcT2as3R1s2Jt+/xoJJaafi7bhTwnPSUahZhezHH
         L17ibF6j9TjZava81HkKIicbKNTLc1pi8pfC6xpJ4/4Ac80tKUAseYctriz6AzD7J799
         7mMTeJTdsFkTyq2tzoXgHe5pbH4ZDcA6iiS3l+pWL30UIJDFiMu729wL6JZ5FM6mQ05E
         6ABA==
X-Forwarded-Encrypted: i=1; AHgh+Ro86KEoTIjsZGqVgDbiBnGhQjYdcCrx3X4StNcpnA8dQLQX3pnoUiEoJldLuJdQOvThFEpxLyyfZ44N7g==@lists.linux.dev
X-Gm-Message-State: AFuF++mrZa8Rz6t25kdp0ybUfha19aBWfItC1CcmJqNF7FGlksSB6zau
	72mb4PHY+KfgPz61rP4zjbCuCB7dFp293xmo274cqrKY4QBvkHmxRLdF57fPoHN9XGhTbfSLZVw
	s2q2J1oJ/yCLTZe3Krar4DnDIOBIoKyzXStj44pv0
X-Gm-Gg: AR+sD13mGjij/pmEvPiA2ZGw1XoaoCMV8UsyhN5F7A14ZohWH1PePUpUDgyc7YvlIMS
	U9z4XrhlyAamCBMnxGLwggBSf+NCMEgT68BazeGwDZX3jf8p/A77jdpGirVyyzXgHhxsw6xeHzs
	VGqNF0C3oUtu60LDpxrKpG0NSpsRsmG8KZDuuiy9u6Z/ERkmoemXAWCqmGw+Gt9A/k8T73t4oDJ
	6eAYNX1lNagNDc1NRN/qYD/O4dm8VIn46Pyyf6xsBODpiOKm9T3RKivHxKDJG++XCrd9aNxRWzk
	OUV/yYUs7FqXsa4FciYrILUxdqVP+ZlFdfSaC4l4XR2EGgS2pOq0CIWYiCX0dg+cJokd+LeWgI9
	QpQcawUlOD/U9RE9DfOeHTfh4bE46FRVJ
X-Received: by 2002:a17:90b:582e:b0:395:4de4:92be with SMTP id
 98e67ed59e1d1-396d0fabb3amr8959710a91.13.1787896200987; Thu, 27 Aug 2026
 22:50:00 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:50:00 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:50:00 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 05:50:00 +0000
X-Gm-Features: AcwNN1VB4Lu0vx7OeyLBFvG_yf7maW27jBuMibH6lUCi0Q10SkfZv_mKR60M03I
Message-ID: <CA+0ovChyLaYfEN19Fomt6qWx6dYtX47Ptyaej3gfMeNGB1xoFg@mail.gmail.com>
Subject: [BUG] general protection fault in sysfs_do_create_link_sd
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>
Cc: falemi@asu.edu, driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/188-general-protection-fault-in-sysfs-do-create-link-sd/

  Oops: general protection fault, probably for non-canonical address
0xdffffc0000000006: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
  RIP: 0010:sysfs_do_create_link_sd+0x4b/0x110 fs/sysfs/symlink.c:35
  Call Trace:
   sysfs_do_create_link_sd+0x4b/0x110 fs/sysfs/symlink.c:35
   nfs_sysfs_link_rpc_client+0x3a3/0x590 fs/nfs/sysfs.c:343
   nfs_init_server fs/nfs/client.c:770 [inline]
   nfs_create_server+0x7e8/0x2110 fs/nfs/client.c:1155
   nfs3_create_server+0x1e/0x180 fs/nfs/nfs3client.c:56
   nfs_try_get_tree+0x1fa/0x11a0 fs/nfs/super.c:981
   vfs_get_tree+0x8f/0x290 fs/super.c:1754
   do_new_mount+0x341/0xd80 fs/namespace.c:3834

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
