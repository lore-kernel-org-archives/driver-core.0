Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6456436E491
	for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 19:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356331; cv=pass; b=uFfd/JBRGNR+5kUcKK8UqpM06/IP4UCoX+DGtO+kMOlqQzkOHMaSaBNBs/vfE5wPqbW19UKZz2rcvrSzxr8cEDOJW6sCgdoKgRI1FG1bUCZ7tSMsqllBh4JNqcT8hjz1jYtI22PMV63yyW8nRnMq4Rm+edHQePgRQxgqAo3EoIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356331; c=relaxed/simple;
	bh=CwHGDX0I/MtzPYs24hZSqz0/ri7iZjm7LIBdNw2JZ84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NntNr8ve91Q6oKHoxw4mcg0zBTSHu+DZn3CrmygEXpaXCm+Y2y3CFQIOF5JpMc0OGaAQ3HtuKoevF/sqJLdp9nev90m+6RcUj4/Juq+o+npjO0VunWKg79L6lpV31KlN3LbUzZ27IqLeH18ugNDptjgdkJSOAZ9HE8kpKk+uUfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x1Axn+4T; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x1Axn+4T"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48318d08ec2so7545e9.1
        for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 11:25:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771356329; cv=none;
        d=google.com; s=arc-20240605;
        b=Ohl7AUfmIzazUD2Ea7DoKY2q5qhq0hEnA5a9EYn0xncM6H7qtgoP1vn7fqcWF3XwQb
         V3Y+23EWpeQhWfvSO+eK1aTwwqtcaitbyWzORyFg7tOvOtcRJAfqaA76EJTqw3ajSFU/
         K4U270c4sAcqg33fnUnJEDwOtjnZiHCLDm5wgWyuVtR5DzKeet5OQU50c3fAabIaC1Y2
         T0IXC/NsRVfCdBLCPVrsq6hYIVwtywfTXYPSUsJE3zzb8AXNBIoVM1RURXxXeZh32g1Y
         WsReQ2iAf4gQO97WISBsQfn+WO6Fp+1wCge3fCOpC35j8aGKEVvtG2XKJoWi+mfKwFEd
         hoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=agcE7U0hHa2jey3GOzRKRM6iuQj3YGWAyKNtM05bfZQ=;
        fh=6ZwIG5idj4GbAe3rEmg8W0cerkSJ5/LhdTxp/D199qY=;
        b=lvJy4pEHcYLigqJtxyNvsrSvCm41iH9RxSH8pM8ir5KFFGJHM4zsBHjGKLGY3z1jxF
         TrvUralEMsa9zVITZ3PK08aloLxZ4nibTP0+2bSPkWISgDxb26diz+6b8pMHYhl/KnXr
         HpiQLQXU510DpRVwzJeEvod9vBVFf17EfeqSDsj7wckCP2UWZnzUjwxzd900mzcBEFRh
         PSJgYDfQhtHaSneH8O0FuZ9nCMy4pCKXb5cT8NfiUgvnEPMuM3ssEU66zWHaw+zeIOJK
         Dnfs6APckUr8bgEac9l1q7zbg1pWzGksdRLoQBkxN8FT0M1IejYj8mftpGqQLllhLvnL
         HftQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771356329; x=1771961129; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agcE7U0hHa2jey3GOzRKRM6iuQj3YGWAyKNtM05bfZQ=;
        b=x1Axn+4TqWkYvrHQLUFNUMNmyETdKlo10urj/Ll9Zqjcu6dzs4D4vTO2Z4V1GRt90T
         Lj8nx24J1rnKDTvH/00MrzvcHjExCCaqWuaESDexBfdU0/41GCV7G+n86AKbuPMn8Wi1
         kI7nJsoksIH6cWH96hOVRxu0B+yGwUMWpweBcookG23lu1j2JHOWkn+JivAzWKW4XWea
         gNSMx95M+Bbhablkjx0IVXWBN/oIDg4jnflmsWcxxUmzxnKjYHq3/+dqlJOgAgtIYhGb
         P0CU0H0uffs5YqbmIUSOSwOKNtN5MKgTeLWIWlBZIyDEsuy/sJGBuErFQ6P0934wHPug
         TUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771356329; x=1771961129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agcE7U0hHa2jey3GOzRKRM6iuQj3YGWAyKNtM05bfZQ=;
        b=Eczdj95jqsn/nbBFip0ynwtjPgdmBYq5aV39+ZRTG3yq3ZyzdheZXQ/RnbG1yOntrY
         5vX8zAI7aQFCswzQaDVJfNZlGzHhit4AwB4ePl42JWFkzl2wbfVw/Q5u64U/8qxZsV4k
         7R5BtKK7T666qrMYxNWKXrP+N/z4Ig6qx78isc6Xm+CSbK5oLvuTBnVQb3PtH0hYGDLd
         1CBkjSlxS7Dx9WUXERyrwlOEJOYffR3Mk7q+xl8fs1I5jPbwEg+izh/xwzbpi8OeLiPO
         /fnhIHXrH57iuKQRuIvpgHLNbtbBk+C2Vvn4IGMP7vQ2q8awCxGN07zI5Ic4GPSLZKv1
         pN1g==
X-Forwarded-Encrypted: i=1; AJvYcCWr0NmbJriB7n/YLKT4L/q290qvClqXwiaLMNCMhaFiS2VbuPsU3DDh1HD82Lg7lKNA2wPO0HM4zEflTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YydQVNZwbaz/LGtfLz4yLpx05nEb8/FDVgb8rdE+cyEWZlvqPnl
	1L2xawcw6k9o7o3Rw56OjaB4q1DWZha3KvtFRlVPJaUB8O3NWcTKg+zAcY7neHbKl0vxo2ZWNq1
	9oEkmCAnbvzN7+9ydWIfdWGemxSs+8kVmxZr9dsD3
X-Gm-Gg: AZuq6aJyBW4pcWiSOCh1tB/Ak/QvCsZQeim/mQYXRxq2fcBgnjfpceUl2Y6wgAMVECF
	WuNWVohi/rl4czjuJ/CHKst/7Rx69cCwRQBluqYuwMRL1JTaAT2UTK0mdmTj85MAA01Npd1hKt1
	r4gg8lzwJCymp3wjyiN5hf1u43K9YAufIZtI88SLd54FoF5bcQcSyqEFme7njw7GHbVv6Xll/s9
	zCoiCecw0XX+sXonSYyxlrYEhuasPGSdTlnnvoMsfi75SvGBlf5A1g3L58fD5/Cvot2DTRHqUr5
	TJEBpwZ/w/bp4YmewpYlqXAq1U4rmrSAnSmCHhi8xQcCn8y6Dl3oSNbGNWbZFsiglS5Rjw==
X-Received: by 2002:a05:600c:a218:b0:47b:e29f:c63f with SMTP id
 5b1f17b1804b1-4838883cf98mr866745e9.11.1771356328550; Tue, 17 Feb 2026
 11:25:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260212215814.629709-1-tjmercier@google.com> <aZQOK_xnxQn09qmP@slm.duckdns.org>
In-Reply-To: <aZQOK_xnxQn09qmP@slm.duckdns.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 17 Feb 2026 11:25:16 -0800
X-Gm-Features: AaiRm50sXuWpunQQOD6edntmpve7h-Rlruw-KS0KVWY35EyoF20ve32-aeJ4CtQ
Message-ID: <CABdmKX0o60fP+ub4w9PBqZ8_5fR-X3RBy1x+XVzekvQP4WAysg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] kernfs: Add inotify IN_DELETE_SELF, IN_IGNORED
 support for files
To: Tejun Heo <tj@kernel.org>
Cc: gregkh@linuxfoundation.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 10:43=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> On Thu, Feb 12, 2026 at 01:58:11PM -0800, T.J. Mercier wrote:
> > This series adds support for IN_DELETE_SELF and IN_IGNORED inotify
> > events to kernfs files.
> >
> > Currently, kernfs (used by cgroup and others) supports IN_MODIFY events
> > but fails to notify watchers when the file is removed (e.g. during
> > cgroup destruction). This forces userspace monitors to maintain resourc=
e
> > intensive side-channels like pidfds, procfs polling, or redundant
> > directory watches to detect when a cgroup dies and a watched file is
> > removed.
> >
> > By generating IN_DELETE_SELF events on destruction, we allow watchers t=
o
> > rely on a single watch descriptor for the entire lifecycle of the
> > monitored file, reducing resource usage (file descriptors, CPU cycles)
> > and complexity in userspace.
> >
> > The series is structured as follows:
> > Patch 1 refactors kernfs_elem_attr to support arbitrary event types.
> > Patch 2 implements the logic to generate DELETE_SELF and IGNORED events
> >         on file removal.
> > Patch 3 adds selftests to verify the new behavior.
>
> The patchset looks good to me.
>
> Acked-by: Tejun Heo <tj@kernel.org>
>
> Thanks.
>
> --
> tejun

Thanks Tejun.

Amir would prefer I remove the new DELETE event support and keep only
the part for DELETE_SELF + IGNORED since adding only DELETE would
create an asymmetry with the missing CREATE support. So I will plan to
do that in V3 for this series.

Thanks,
T.J.
