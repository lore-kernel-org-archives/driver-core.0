Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC31836A03D
	for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 19:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356327; cv=pass; b=Qiwa9XwxiZc7VXxzy/Ns7MLuHbJsvZhJukRupCJ+M1AI7Cr3w0IxUn0HTG8++FMkyFSo4+xm2Jri7Yf06lM65oz24/3KE74bIjz3NX/fnj4uNRN+3/syCnV19glAEQ2PyMQHKObNBmuU3YIOnx3ktNGtvlAtqGS15D7r/9PZtc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356327; c=relaxed/simple;
	bh=sewE/sl1jGzvTdHwbA17sP0tHhoksdxDyaxVGzvfzrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hFcYHin7oWmGgJvC8t3wYy5K5zloj+P602krcL1okTduZY257NdW2eQC/TyW1VYspwFtG/zGLvKdKTUUxJJ9y90nrxak3s/kCpXasl6YEf26IQvLVuZJ/DhRvNFaf2iGpQOst+PQuNr4gEmKoXNKVV0Ujl77HtggbgMxCceviUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N0bbq3lA; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N0bbq3lA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48371d2f661so8065e9.1
        for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 11:25:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771356324; cv=none;
        d=google.com; s=arc-20240605;
        b=Tnue+hiQUQ2d3v2qF63/sidbBUnc3m23R57uD7Y67WdroS7BEzEMSMpWbB8JjeU0ca
         o4qevSa6m9Vw8nqsTRIdNK1/gLNwz0Abz7n1OOTPQIkH5odl3MlqbFFtqhunqmYt1I+M
         eshDFwAsY0pRtdUsI62cGaFukkmEPcyCVfhxSvbk7+4RMQLTHy3ATZ7WfG0yhU2aVAkn
         NQJkipzstqCJ9v/kLpLv4BKAYCM07UYTv3GMzX8eAqxg4hYogt//2nUYAwJk0qAwjDhs
         QzhzeFhPmIlHj+2QmTrYCbreHHhgvaJreVgS1rbExEwat8tFVIKPNymworQ5U9zGwasy
         /xrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g0ibeNCc7R8HXhy/DdkWxEPCCxKLgy5A2bxR1yxzMM4=;
        fh=nrjkE40vYMsJF9aJTLuDi+MtYLSZWdroEtgvRG6gDr8=;
        b=ldRZrVR/34doDfyQ3/uvU4R9fEf9OUHuziSrP9lqdxkJ5eQpeqHJX0AScuDoRRfPMZ
         xsXjVHUccY2lUYh0iMtTmWebVbYt2nc2wvbwCDY7ORSjq3VAuqpHZLKJpXPLSRJ/RTpd
         i78zCtmTwnu9sEU9CQsyF079/Kb+Oq37x4hzQhVTQe+3TiUCLHycrI/1PpYYA3Ngwszz
         Ava4ZPtIOjvoi0oWvpPUoot2q6jB7HDDB50smQscC3qVyx7krDrGkkHW60iqE20hSlEm
         h26aW7uMZuXUHlccRH8wDQhSp43umFC94BzaCcxvS13ZZFht7UdkAP4J9hLElOgb4PpY
         vNMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771356324; x=1771961124; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0ibeNCc7R8HXhy/DdkWxEPCCxKLgy5A2bxR1yxzMM4=;
        b=N0bbq3lAs8itrUBdpP1FJJjmdPDlMMw6ky1dNbwpjt92KBicgQP9LvxGm4YmghbODR
         ejO2kNvCIvcVZgVacrk45tyu97QPKpskSaLPp5Gou/A+F9qUebJ+tSG7MMXhKi4W+mPN
         6NbKywTtlyyEJLBtUNZQS9+LOddPdL6FQUZVYU8tuRwLjewNMXavJ5mF+NIa8uGwI0a0
         hxWH8haS2o9/7PiKbgDxE306fw3q4lA9le9AzhFlwp5LlEV+sEdkEJL9hluv85T/BMFQ
         aMFLvWQspGoOprbNx0qDCXu2QB7psKnbR775YKgJu5ClWek+OfAKZ8JhIOJqes29yuQ8
         11wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771356324; x=1771961124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0ibeNCc7R8HXhy/DdkWxEPCCxKLgy5A2bxR1yxzMM4=;
        b=BE6+o9Trf5SNOCSEElLQum6AwBlownbV/ltadEL1scDdF8wMcr+fL9zFq03juQnzVg
         rZb4th3Gx6zqD8ebXMX6RkdUww6p42VltLfVByToYTyAMEi0J1uNDQBdjYm3WQX+AM85
         JkhSrtOgJ9Snh9cVrk8h6eOhNJ8eND90UPkBHdhdOHzVzLGqWNL3T/CpGrLmG2s0ZW3z
         omWQ6YH+bDl/jbh8HXnQ2D1/3rlLHuvAwjf2RMvDtRYgy8SNpazrxdiNPpd5oLcStgLW
         fWekptZvX7o03YbST7kX2MZDzZDXW2dXUAPdmgvidTYG9odC5GVjlVzl8vK0KiEn8p0d
         1pxA==
X-Forwarded-Encrypted: i=1; AJvYcCUh6bqWC9TktYp3FTygz8k37PSbXZ5JT6FAwDau0EgoSnwo9ih0otAo7Q0/tTyjSw2GvGwLutnKuGRlNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTiK0s64mdC8EdIhpDp6+BlLnOlFnKk8Pvr0YvgQqMqkHVv+df
	wpC58D2S90mxVMUjzq3Nsu5Ngd9l5/17igszulBZDFniNkmjojD/rLLBU+66qjZBx/g5ndOob3O
	JjIvxVhqPT7twQxlGFusjxttyq0sWZcxHrI+rxrMO
X-Gm-Gg: AZuq6aIGW7xM7etaURslWgp+CEN4EgukJQQLieiRKE6jjxx0m08/ne5zTczIcfhdF5Y
	4lvyygpN/0gD8++oUSmkrpZF4VsEyZUSco5/+hMPrwM4tT3yS+6E8EA5gQ6Xys0tID/UqgMnrUt
	BZOFGFhbolPnwcQzKQaX4GbJ94th95Fbgn6MtYD/qlQlrm8S9EGD3Z5ykn2FFiKrE7nIGdxClp0
	cxuvEDDngyLwW41Hwz4fdslrldAQWDlXJ21V852jjAmSt7bwEK5z5i10/GvB4+d+bEBOLbUg+gL
	wzp0zQn15mYcuObqQz2a2fwR4c3snXjrhPnlcGPdrpQph8dMoVHcgXxCunfetPs0vmqung==
X-Received: by 2002:a05:600c:63da:b0:480:4a7b:228 with SMTP id
 5b1f17b1804b1-483885e39f1mr1287205e9.1.1771356323780; Tue, 17 Feb 2026
 11:25:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260212215814.629709-1-tjmercier@google.com> <aZNDSl3GPrNBGwmL@amir-ThinkPad-T480>
In-Reply-To: <aZNDSl3GPrNBGwmL@amir-ThinkPad-T480>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 17 Feb 2026 11:25:11 -0800
X-Gm-Features: AaiRm53P6sMj72saz2iRJgcKdNr5FDsRWfFewzT5upX4tAB-ZB6-gxFZCLtvsrU
Message-ID: <CABdmKX0CU+bOVDdq0V50TfP6RHr23EJj5XeA_e66BC45gLDsFw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] kernfs: Add inotify IN_DELETE_SELF, IN_IGNORED
 support for files
To: Amir Goldstein <amir73il@gmail.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 8:21=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
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
> >
> > ---
> > Changes in v2:
> > Remove unused variables from new selftests per kernel test robot
> > Fix kernfs_type argument per Tejun
> > Inline checks for FS_MODIFY, FS_DELETE in kernfs_notify_workfn per Teju=
n
> >
> > T.J. Mercier (3):
> >   kernfs: allow passing fsnotify event types
> >   kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
> >   selftests: memcg: Add tests IN_DELETE_SELF and IN_IGNORED on
> >     memory.events
> >
> >  fs/kernfs/dir.c                               |  21 +++
> >  fs/kernfs/file.c                              |  20 ++-
> >  fs/kernfs/kernfs-internal.h                   |   3 +
> >  include/linux/kernfs.h                        |   1 +
> >  .../selftests/cgroup/test_memcontrol.c        | 122 ++++++++++++++++++
> >  5 files changed, 161 insertions(+), 6 deletions(-)
> >
> >
> > base-commit: ba268514ea14b44570030e8ed2aef92a38679e85
> > --
> > 2.53.0.273.g2a3d683680-goog
> >
>
> In future posts, please CC inotify patches to fsdevel and inotify maintai=
ners.

Got it, will do.
