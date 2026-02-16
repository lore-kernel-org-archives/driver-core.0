Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E9B312821
	for <driver-core@lists.linux.dev>; Mon, 16 Feb 2026 16:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258876; cv=none; b=l4Igh4SvSvrM4VfN+tsEke6Ie5m0NUK+5yeS/bLSzTZNlCozPew8ouF37kfZs65VSsZ/q9MieFTiAIJk/IfVg7ZXcJ0mddk0CPV/0JgYniOfTQo9tLbKCakOE6mfqxDazVuBewK7lDnaId6ffoMUFTZcjWct5spJAKUl83PWFfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258876; c=relaxed/simple;
	bh=vXPwT/SWHN0vRTO+ghXErJHF9bFSJOc15B0GoDaOvpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6hMbqXQJOjsb1IzV6x0BVSUL0Dyw654OvtRlZjUCeOYvygckRm5bd9aJsIfeHb2Flp21+5Am6yvozvD32pLB9BJEVZd/CNDwqW5AX9PVZxpmL5Akunz6fOFZImDo2AjCO7SfSthFgXA9kNPyzI4J6DWYbi51sJT/CM6lTjSWHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTxfZpjv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTxfZpjv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48375f10628so18994055e9.1
        for <driver-core@lists.linux.dev>; Mon, 16 Feb 2026 08:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771258873; x=1771863673; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ScvhChnO4StcvknG4EO4W1y203NmQMeHjxbNv7iKKOc=;
        b=aTxfZpjvbnixftT4y6Lox6uXvMx2cjC3T5iJSXMtsJ3yvlvaFMCp9HnnEErUCStUsR
         /rS7Gsc5nARmWUtsKGJtZZf6lHd8nasdw27B59qz0UZokreYND6pLrcMyUmPZFh8Zq/A
         hLtntDtCpHWy2Fjmwg2Z/C5qcw27e76ifkDN5xVl6QGGFh4njYhu7mhwGzr4sVK4RVpH
         cy7gUxOa2U4RShsy6dWUTOgemyxDizdVxpQgBCUoQlJKkeFFgfOzhXS+W9nk2E+Ihtls
         L2k0BxcKHz0XfI/dNtilqWz7lH4Qf9Su1q1ej8X6y6gocmKBxG1f3762mZ4JtxQZZCw4
         5sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771258873; x=1771863673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScvhChnO4StcvknG4EO4W1y203NmQMeHjxbNv7iKKOc=;
        b=XEzR1KCMg1EdfKdJtiu77YLombGBsXexka8X8yuryw9X5RTypD2N7XMNadbjRLWtq1
         YiHMl+6DTr8vpJDTpS+wL52LzYl7yoSr/ms+FK6Ptm52f5iz67MY7x44vCaSf0q72B4i
         z6Uz5er6kUhePyyid7DyHnWlK7nGxsINUjHo3F4T8gYmsOyGtc+ug5FUGxcYdgEXH/vN
         7XVvfDoNxrLKCJ0qvmRzZjUNIRSDID2Rodf5Jy85I7RY5IYQ44/HSS0SM8DAoSKjnzxS
         C4EtsCO4Ue7mivPklycfr36ESZQX7muDsKCyPXC9u3ks6jUiZbMHfcS/GZ0k+H5Pm9y7
         ncYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3VD9WQNEXjRdCZOCAJiwqEJkTmyqVIrnQgxlf++7MuNkH5IaCtM7wJP6mp5vULq8WQoQx/S8JJmUYYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIgcnwy0kTCfjO9H7mKEsL75dvHIFvnN0viIVfCCoIJFZXzWoH
	jUmwrXaLmR7BYa2u/5MYLB7ctQou4VvTlTmbKr0oktuqzV+lx9jIEcapDCDWBgJc
X-Gm-Gg: AZuq6aIc8LYzl3SxUN+UeOmRe9heP2n9qCELVge5vsruT2cWaoK5GbBAZ7DjLZvKCds
	eTd7cjehNvIcL8CnIUxesSJjyeTkP266KhnQsxW3lS+5W6aG9hZ5iexYQgjP7QUPnArhIwWf+4k
	UtWBZ7k1vKth6ACcSx54XMHUBf5datAS2yBDdj4WqGc2ZuvQ7NzJQR1BiAVCQjriP6hy50l0/e0
	lVNBC0alDT8Ii6Bll2veM+hF2ISWQqMoCmLN8pqyaOz1T8vGXGmkVjnXKZ+GdaH07uIwP1LEKVm
	JDZKFL0haB/BnCuE0c/gj69lNjPCa27MbtvuALR2yyb4Heh1YUpavU4uHSnIIw7tjTx3WBVUiqX
	pivltHWxipREL7oatqogDkZH9+1vjat9AClGxwiA49UW7GMxTHqpS637CP1ZXky1bOE78ywpUvC
	k69Err6EyhE3ymf0Is2dITyeJ6n7dgXJfc1PWFKeYUkAuN90sT2SGPIbiF
X-Received: by 2002:a05:600c:8b32:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-483739fc64fmr193175955e9.7.1771258873226;
        Mon, 16 Feb 2026 08:21:13 -0800 (PST)
Received: from localhost (bzq-166-168-31-253.red.bezeqint.net. [31.168.166.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836cd7af87sm321885895e9.1.2026.02.16.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:21:12 -0800 (PST)
Date: Mon, 16 Feb 2026 18:21:11 +0200
From: Amir Goldstein <amir73il@gmail.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/3] kernfs: Add inotify IN_DELETE_SELF, IN_IGNORED
 support for files
Message-ID: <aZNDSl3GPrNBGwmL@amir-ThinkPad-T480>
References: <20260212215814.629709-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212215814.629709-1-tjmercier@google.com>

On Thu, Feb 12, 2026 at 01:58:11PM -0800, T.J. Mercier wrote:
> This series adds support for IN_DELETE_SELF and IN_IGNORED inotify
> events to kernfs files.
> 
> Currently, kernfs (used by cgroup and others) supports IN_MODIFY events
> but fails to notify watchers when the file is removed (e.g. during
> cgroup destruction). This forces userspace monitors to maintain resource
> intensive side-channels like pidfds, procfs polling, or redundant
> directory watches to detect when a cgroup dies and a watched file is
> removed.
> 
> By generating IN_DELETE_SELF events on destruction, we allow watchers to
> rely on a single watch descriptor for the entire lifecycle of the
> monitored file, reducing resource usage (file descriptors, CPU cycles)
> and complexity in userspace.
> 
> The series is structured as follows:
> Patch 1 refactors kernfs_elem_attr to support arbitrary event types.
> Patch 2 implements the logic to generate DELETE_SELF and IGNORED events
>         on file removal.
> Patch 3 adds selftests to verify the new behavior.
> 
> ---
> Changes in v2:
> Remove unused variables from new selftests per kernel test robot
> Fix kernfs_type argument per Tejun
> Inline checks for FS_MODIFY, FS_DELETE in kernfs_notify_workfn per Tejun
> 
> T.J. Mercier (3):
>   kernfs: allow passing fsnotify event types
>   kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
>   selftests: memcg: Add tests IN_DELETE_SELF and IN_IGNORED on
>     memory.events
> 
>  fs/kernfs/dir.c                               |  21 +++
>  fs/kernfs/file.c                              |  20 ++-
>  fs/kernfs/kernfs-internal.h                   |   3 +
>  include/linux/kernfs.h                        |   1 +
>  .../selftests/cgroup/test_memcontrol.c        | 122 ++++++++++++++++++
>  5 files changed, 161 insertions(+), 6 deletions(-)
> 
> 
> base-commit: ba268514ea14b44570030e8ed2aef92a38679e85
> -- 
> 2.53.0.273.g2a3d683680-goog
> 

In future posts, please CC inotify patches to fsdevel and inotify maintainers.

Thanks,
Amir.
