Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227F83D9DD6
	for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356054; cv=pass; b=Daqck40N5uUqtgukS6cen8itwmoQK8AcR/zlrrP6pEOAOCLPP5Yst+m3fytHwrDkIXqLzMrdTvWxO8iYucI/8OYBA6A440iWvrObhKKCNPd4FbEC/LEct14L9PxgOXXlTpQmYk9EKRtLPXf1QITLafR4fSfN3fFhKtIyG+gN+z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356054; c=relaxed/simple;
	bh=Z/QlDjEqmTsvd8hmVsRhjPJAPZKduCsAshcn9SEcHsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=doB00YcFjj7ylLJudIwQbZmFthcVCptYRF+dGxjiR6xT6BegRZieWJHUSR00Zj3ZDurFMmmlqYwOFnPiqi38BQqLHbjutcby4IljdEfpIWJpWI+mJRw7fjSd/VdmbgSrUCiAQVYchgyZQkI+mj0u2iPV2++mw2AEHgWhCJsEue8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=XNzUdmCp; arc=pass smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="XNzUdmCp"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df958a8272so4264815ad.3
        for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 10:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790356042; cv=none;
        d=google.com; s=arc-20260327;
        b=aAyVgOyF5ZQbl4dnigNp0yed1Dlq5y47UsA3AkLjOOZx81FKBb1i9sWqvXTBZBbgwB
         NcITvsiBpJtX7JqLPHuwCSEtVEZWAPQx7bB/KAwhwc1QKNnOzOxEzH/s18GrIP67J51x
         IgBrG6Btk5gp4oqpEc5hYzI/jrhrkEWOaYvLNoTW6yNjkV6L4oT/whyL0HYnyb072zaO
         I6iQR8tYsoLwmJiWHTpD1CvKGoLgm2yWoMbRJziN1KOlzoccK0sxVE7j1KqYCKQcF7Oi
         YPQlkgqG+oVQ1w1je9v2VG3cngj5LBhjVFK1kl0twW0ltkiMM9+xU/UjNwLqPrGPvq7h
         qdVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        fh=kBmMAFkZBIDFMJh/Zib9V8VBG5X2zF7KrNTPcV+LEFo=;
        b=Bnv0V/SR4oUJPe3Wb0oG//Gn/8QkKxVBQ99l03AU5YmAyzijoHFPPd6u1ls1KTc/0K
         WR2oovurO395JyfALEFMHQLkG4PRNJGbL3NsxvHu+Be3HjObRjkmmy7Ow4yhTz4xR04s
         yY/wWXa1RCF2m/vMb2gpsSM9pmREQhEXjmqTJfHpfjiwstVZarMLSUnJvgYur9tWLu3F
         z+hHbWkw7oGKWsHXxTF+WnoXOb9KFa+PZOtMcQwdqZzzNpPtcV4iQzg+SoHd8/02/xz4
         Ts6gwzjF+MhxqCyx3b2J7tQe8br6+r8bt0nF8840c1Fte4ZGrt88rSy4Y+cY81XY26wi
         mnJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790356042; x=1790960842; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        b=XNzUdmCpnd1ky36YmO7X604JgVUPNvaQIjSba1rhMLZp8b7A23jp9GfXpAaunHzp+u
         RhJ8/R0ms7rIJXHT32bAkPuJ511YQjBsWEsr9NVaiNrwLmegSaY8ETh4G7SZIDpw6a3G
         HLQIkaLbSTbnhlqS23geQcFGca025RxwAKtSLnwRJTPK4MsG/e41JVkXI0l5kOoqOxcW
         Ot5KA1kx8BdjqMqYh1k7bV/6JzENC9xrb2pM93sFd8lt3FPWBR5L8NnFU8+IvI1sw2oW
         uiHON8+ajIN4JmtVQ/wOjlDDYcKyoyDprNBgvoYxJMJX3NKBwCluVoUOfVV21MVjlVoy
         q5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790356042; x=1790960842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        b=vNL1+Fv20528gIORZ1sFUhpSvIqZmzaFCQOjXEP8hCbIHuWu7NF8By80Gxm3iudpNx
         N4C8u2RqT820V5uzoE1nN7oAviCENhutxvAR83Mg2Psu8lTqn6nzBP34TMDdeqgUtude
         FyZygxiaJ/RGmVX6rZBzxuAXGNptXC2gksc3Ii+LPyO5M15aFH7xTJw0rOGMG8ejJBlD
         sCjlADZcj/C6PSpdZK0wD8wEC2X1y9t4gHGCC+qXc7i9mj+T4ZZ/z01WzmpIojt1TXYy
         1W3lK9SlvJgy3LbVUva+ycmsWzDyKpgofAvNnSd8H/b6DNkr5bYjRVTtXbyfAhK7ovdz
         V22w==
X-Forwarded-Encrypted: i=1; AKwUvByl9x7ThTz7abqn5iOcmGlf70X/PKg6TE2Sya0Xv9tx5cB1ynelZq7gM6Yv86XeVluzsXq2TIYjfxgOUg==@lists.linux.dev
X-Gm-Message-State: AFuF++n1bo2qAut1j3DEb6veYfkckyyQ8/cnFfeOdXdqG2NC9U/w6cSs
	KsR2oTNTjn0G6WtMmyUWvbrhdPYqaOZmRoCn4lduZPNRsKi5eRK9tHnRUMymN1SnOZji5uiMWoY
	kkAYik5iof7WHJ9ls/zTs67+d9p6ufyQfW6frZVva
X-Gm-Gg: AYBFou0PrWfTgWQhHhj5qN/tS6D9n43uHInXtwJC0wNAVJ3RGCvBrnZR+4EuDutbEsg
	qFh1/f9abNZBpjbZnpZQLcIcLZqnMDMA6KYER9C5N6aMQZ02kQFMtNiKobWdDJWSOqE5tGrRU4q
	87nBSZBbcNHlon70gQe09bjp1FefVUdMOLG4Qpw+LMXHj3tvGPyJ3VJKp6DBQ6zshTbxYOcjX2E
	XCWN7SX+fUSt1cYnccQEJ6eFRQjczsD9NS14MkC/uZaJPgesuCiF6VcVo8REvo/jeTMHRXqJu+3
	Yf2sdpAg9rsErnhHfYTKZiroFNgtzuvlXTzAiQHHYC78K+EsLiy6XT0Ts2OE4RkCqtUYl1fMknW
	gLxx4e5WIJTraiaWU+YojLQ==
X-Received: by 2002:a17:902:d48d:b0:2df:99e6:9448 with SMTP id
 d9443c01a7336-2df99e695bbmr12902675ad.61.1790356042370; Fri, 25 Sep 2026
 10:07:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260924104831.1081137-1-caixinchen1@huawei.com> <20260925-zahnersatz-hielt-lerche-141893658522@brauner>
In-Reply-To: <20260925-zahnersatz-hielt-lerche-141893658522@brauner>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 25 Sep 2026 13:07:08 -0400
X-Gm-Features: AclHuK-PYyMWIn_xv6i13K6lF_3RP26uUOO_mtAnUMGHNcMrV5ydBitx8qn_ri0
Message-ID: <CAHC9VhSeXmOHvioZ12aVmnOtpP52-G=K_jS3K0fTSiCrDHStPw@mail.gmail.com>
Subject: Re: [PATCH RFC -next 00/12] landlock: Add READ_METADATA and
 WRITE_METADATA access rights
To: Christian Brauner <brauner@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Cai Xinchen <caixinchen1@huawei.com>, gnoack@google.com, jmorris@namei.org, 
	serge@hallyn.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, dlemoal@kernel.org, hch@lst.de, axboe@kernel.dk, 
	viro@zeniv.linux.org.uk, jack@suse.cz, dhowells@redhat.com, code@tyhicks.com, 
	linkinjeon@kernel.org, sj1557.seo@samsung.com, yuezhang.mo@sony.com, 
	hirofumi@mail.parknet.co.jp, cel@kernel.org, jlayton@kernel.org, 
	neil@brown.name, okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com, 
	miklos@szeredi.hu, amir73il@gmail.com, senozhatsky@chromium.org, 
	chenxiaosong@chenxiaosong.com, zohar@linux.ibm.com, roberto.sassu@huawei.com, 
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, 
	stephen.smalley.work@gmail.com, omosnacek@gmail.com, casey@schaufler-ca.com, 
	nanx95726@gmail.com, djwong@kernel.org, daniel@iogearbox.net, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	netfs@lists.linux.dev, ecryptfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-nfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-integrity@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	xiujianfeng@huawei.com, lujialin4@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:33=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
> On Thu, Sep 24, 2026 at 06:48:19PM +0800, Cai Xinchen wrote:
> > This series adds two new Landlock filesystem access rights,
> > LANDLOCK_ACCESS_FS_READ_METADATA and LANDLOCK_ACCESS_FS_WRITE_METADATA,
> > which control access to file and directory metadata such as inode
> > attributes (mode, ownership, timestamps), extended attributes and POSIX
> > ACLs.  It picks up the work from the "landlock: add chmod and chown
> > support" series [1] and follows the coarse-grained grouping discussed i=
n
> > that thread [2]: instead of separate chmod/chown rights, metadata
> > operations are grouped into one read and one write right.
>
> This is mostly fine for me. @Michael, for the fs side of things I would
> give you a stable branch vfs-7.*.shared.landlock.path that you can pull
> once this is ready.

This is in my queue, but I haven't reviewed the changes yet.

@Christian, I'm guessing you will merge patches 1/12, 3/13, and 4/12
since those are the VFS changes?  Once you have a branch for that, and
we have all the necessary ACKs, I'll merge the LSM changes in 2/12,
5/12, 6/12, and 7/12 and then Micka=C3=ABl can merge the Landlock patches.

Are we all okay with that?

--
paul-moore.com
