Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795456427;
	b=q9p7VARnG8XPGcvPQJeE0QFvVqqkREQ+hlGoBcu+F8d5+WMYtoeQOXQh+wUNgZb/WKTx
	 czitlCIuWByWY+DVqwJfIfekHZ75xHy8uRtjvAbCdxXtgBeSND+DebY0tScsX/Fq+4saK
	 Flor218bwLQMNAtvzPGEpvPCSCzXOsFPO/FKHyHTp8FjCWtVqv0Jztrmfa4iGadA5OkE9
	 7kGNnnmfhTyB9ZCfHUq5RAFA5qIhXnrsKzDj2/ldM+kbXdyk0lf1++nGTLQ0zgWnVUrK/
	 CCtYxe4w5NkB6XoxUoDgx0dzyIsc+KO/v2LRQqwUl/qYp+Bxk9Tm3t3SiIiYVbplurQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RRZcWU4JooS1Xssmhmit/2z3n2umybpGN0QWpPuhuY4=;
	b=ZXtcOlWkpFYgS/Ecp0YNZDy1YkFc7bqhRaROgiZnYKZWDMU/gNxuMvfS2v0u2GzOpgea
	 KcXbq82azfBGpevDHSqLK5qZrnni0wN2Y3wCWW5NrN6nfx7cyEsUQcSvWWI5joDmXk70O
	 CFdoh7zOGZ5gru1ifslnyxRagwQJG0IhK/swiTXISH2Dsdu7fleapI8kPtORyLMqiu0R9
	 I3H7bjOcTty/mlI7lLbJPywsBDIvdMmmYT6du3NvQIZOJKhwuHKwWzXWfz5ThPeMUEFBD
	 d6RQEnprqOGizTaKvlwZB3vJUtPEf7XdxDEH3jieObQmf7Ljz1BdTVxNsI1J7Jw1+vA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VtiZdbya;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD210606A31A
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 17:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD210606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VtiZdbya
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb845433b8so77695e9.0
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 09:53:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795456425; cv=none;
        d=google.com; s=arc-20260327;
        b=X+E26m57TT8pHFqWoOsGDKaIa/whd4OBb+4tlUGnmruUjDUl0O2oiG4OZaQDy6MEZL
         GOYY/cZkjBsQpg8+CmsC+lDq115qk8640uFKZnILY6aQjQswdwduVSNTn8hK97O4x/OJ
         7enWvx9sbhli1NUZDOsfc2OEnnUzWg/4RLEjPrB4Q7iFM0gu0m5yflKZht/ztYRaMVTQ
         djF04xvs4spSB5cxRMq152d7EuNLNaplFFF24PjRI6fa454t0Eivf74gXn5kVM4HTMLK
         P0+eheD80+F+3KORY9HM3j3fw9/QXF6rX0opQIpYy3m1Q0eE+pRgLSkJB7YcDzguGzqb
         r+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RRZcWU4JooS1Xssmhmit/2z3n2umybpGN0QWpPuhuY4=;
        fh=ZAbtjaS//q4lD2ARsyxRmLtVxPbK9ojhznD0vkUQxPM=;
        b=osSGOFuTm7mnLnr7THQ/ol1bCVOfD9+5c8jatXNF+Bt7ZgXCBe+hgTTdeCw+cD1Hfw
         ODn/ncHY3VMu11059wCUxv3az+Y1gFwpAAmfXSMm0T9rv58zg5gcBpzuuE9QOW5ueZiY
         jtwwMbk/MxNMKSAekWCz7nULl2KfVAC/OTLbDsXK0rLEZ9L7fNog7uJEC3n65U/rVhtd
         trZFX8IReR1dI617CJu103oXTGcysYVHLA13fEIR4rOjam4tNTVrkKCYfNvgbJ2LM0Wn
         uN/BJvuPuGlrshcn2QlIxeTQXpuwldcX0z5Rq0M6k0zz+MJvfZDpFJMEbOKAYPXFwWtd
         fvHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795456425; x=1796061225; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RRZcWU4JooS1Xssmhmit/2z3n2umybpGN0QWpPuhuY4=;
        b=VtiZdbya0latErz0ge5+VhlJ10glonZMUJ7z3IIcmQeN7G23S8PZBBy0hV5p9BKiR2
         SD2pcOiY7DrzYEh+2nbQIj2LKCiSl/Pi2s1uwN7yRaUmKrPbCPo/rahQFvYp6QebuyeK
         t5DReWvwk6kRMgK/TNnhHnlZ8qd5SlGIbs+Hzltty07KaPWysoblCwUZafeVnMtogQON
         w46WJv/YjpkmMvmGXvVOsiGOf27h79XGuK5Mpw505SaZsEpAwG6EF+nEFxjziVW2nirN
         wy03ba1HYxBBWxmG5dGnEPYWUq+bXi/qmBJvmM8a6WfhgMMY3YoUb/lF3mzTHiUvCDJc
         Y/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795456425; x=1796061225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RRZcWU4JooS1Xssmhmit/2z3n2umybpGN0QWpPuhuY4=;
        b=u5bKVN/0XnE6swgzhWZ8dZQM4fYuagXKq6e4iNDKX3PQCGtWUAQj2+oXvS2jknISIY
         HT2I4jHIy2NKuiqK8FAcoBMalJtV0eFeFSvxmMlUQUqTC3sV6FK8SJ8Z03vo45VP0UHe
         sLnouoWqDHh3mQyQ+eTmCTHqTcX6xADOBXCLlKWZdaP6iRzot78UZbHD40qYISKMITIq
         XyjOC1T6gy9OT5pdLHILG1tI60GZFoe137vaTAN8imvnCqzfQUEgaoTg8VvR3Mrq1/qY
         vtk3l7jLeta0/Y5VGMtUh0NzxnO12UtqvPILUl44XgG8aXiOWFNFVM+KvOVgdMXWaWs5
         Ciaw==
X-Forwarded-Encrypted: i=1; AL+hErGJdyh74a89Csomq1y0IeYsZVUiZV9/HT8YcNJm1IODP2LP80PeUupztgaGKiSArP1dtc2bFeasGue1EA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+sGdnmA9zw3tv0c6aS8yUoRhc/wt2EEL0dc6VNIhddXjbt0TQn
	ACtwXF/waXh37A9cUi0NpebGlVwCun5mqu9Z+zspdlQBVBVTNcNdiGB6LTLyiIjUSiR9d0wxQEO
	y8frewjbw3+6s/78/OhZFQrVspbB4SXWObmsGGHQ8
X-Gm-Gg: AZFdTZedfbN/NdeiN8wTg+ZU6jNlJMmxLLiIBDSCvKUGGJSjUDzM/LxcoeUo6f6xk5d
	VoyYnyKOys2bXLOLv8dD29V68FbkxbHPVdtarFNA0EntTj5lrIiCDIGkCcMrojkvg/7bJIaoewg
	pHkbtWOOju5bJpmuZ8JRp30IhepzqEJ3XouKHmMzXuzbysuonIejg751DjtwYUmepMb7vCuO0/Y
	otkqPjD1I+TUvlRfSyl3ih0Cwl4HamGSZ+dWcjJPqU1gb0BbBBorLwEBtpI1R9aSjNULa4zJKO6
	pbFd9SfwHah14sdEh6qwjlsFoKs2rlSj7ziqb3ve0w/TO95N2jE1k+JLDy2Wy2ez4t0yyizALXE
	ABMH3LkuPEyIBotQFhHDCQX6f9266DWEc4diStf4KNZPDvOZMvEk6B3YHRxcLRTs7sVJQSD+wmC
	dVsgdtX9+RSelgpNGUMUTczMV8
X-Received: by 2002:a05:600d:6512:10b0:4bb:7ae3:3517 with SMTP id
 5b1f17b1804b1-4bb90bc3163mr1231475e9.4.1795456424900; Mon, 23 Nov 2026
 09:53:44 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-work-kernfs-delete_self-v1-1-514a35d04431@kernel.org>
In-Reply-To: <20261120-work-kernfs-delete_self-v1-1-514a35d04431@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 23 Nov 2026 09:53:32 -0800
X-Gm-Features: Aa3M54ob7XYovyBMvNusAZSyIh_lIUnU-OICma0eFsVui65MkMhLZKbHyrFxGng
Message-ID: <CABdmKX0gJbjX89B7Cxerh7AUjP+dJSOm09TmY+Q_AYTge5Ukww@mail.gmail.com>
Subject: Re: [PATCH] kernfs: clear i_nlink before deactivating removed nodes
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, driver-core@lists.linux.dev, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Ian Kent <raven@themaw.net>, Meta kernel team <kernel-team@meta.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:00=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> __kernfs_remove() deactivates the whole subtree first and only clears
> i_nlink on a node's inodes later, once it unlinks the node from its
> parent. In between kernfs_dop_revalidate() already fails for the node,
> so a lookup that runs into one of its cached dentries kills the dentry
> while i_nlink is still 1. For a file of a cgroup that is being removed:
>
>   rmdir("cg")                          stat("cg/cgroup.events")
>   css_clear_dir()
>     __kernfs_remove(cgroup.events)
>       deactivate the node
>                                        kernfs_dop_revalidate() =3D=3D 0
>                                        d_invalidate()
>                                        dput()
>                                          dentry_unlink_inode()
>                                            i_nlink =3D=3D 1, no IN_DELETE=
_SELF
>       kernfs_unlink_sibling()
>       kernfs_clear_inode_nlink()
>         i_nlink =3D=3D 0, but the inode has no dentry left
>
> The inotify watch keeps the inode alive, so nothing ever sends
> IN_DELETE_SELF for it and the watch only goes away once the watcher
> closes the inotify fd.
>
> The window covers everything between the two loops in
> __kernfs_remove(). kernfs_drain() drops kernfs_rwsem and waits for the
> active references and open files of the node, and the clear itself
> waits for kernfs_iattr_rwsem behind every concurrent permission check
> and stat(). In a VM with a few threads stat()ing a cgroup and one of
> its files while the cgroup is removed, IN_DELETE_SELF for the watched
> file got lost in 16 to 33 out of 150 rmdirs, and it didn't show up even
> after dropping the dcache.
>
> So clear i_nlink in the loop that marks the subtree as being removed,
> before a node turns inactive. kernfs_rwsem is held for writing there, so
> no new inode can show up for these nodes while the loop runs, and once
> a node is inactive kernfs_get_inode_locked() refuses to attach one. Two
> overlapping removals may clear the same inode twice, which is fine.
>
> Fixes: eea5d2bb34ba ("kernfs: Send IN_DELETE_SELF and IN_IGNORED")
> Cc: stable@vger.kernel.org # v7.1+
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
