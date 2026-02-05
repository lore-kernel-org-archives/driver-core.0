Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFC83F23B3;
	Thu,  5 Feb 2026 14:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770302117; cv=none; b=fOO2JJl7QdNYjXCbMg9Ub1cZZ0zAgJrD1/OXi+HbD8O3EBuQtNADXsBsu4de9/On7UnUcwcZMCIrI25y5wClo9f+f/BixNjICVH9h1SmDhuFca+obGn26jEdIveZ6+9RKaVZBEdUXW7Wipdr0MdhjzwKrY6TEMCN66mhU48It+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770302117; c=relaxed/simple;
	bh=JjZQrhEEWroyYmHd/kf2/OSkvXSC76J6jrQPwRzc9FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WognNGtykkm2cB0y7osE07aADz379WVtYUoS1T0yKcxGL2tFedTy2sWN4qotB2fUa9ZBg9QPdYTIvNwVHTUxuImuVTYy2w09NbVsoB9E8Vm7Fh6az4Mx1VMnGEYoikaa4kaVPhiMMIiIFaNDXUpW1YCP/2l61V9vgRg2kbDpb68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoofFKzS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoofFKzS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2032BC4CEF7;
	Thu,  5 Feb 2026 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770302116;
	bh=JjZQrhEEWroyYmHd/kf2/OSkvXSC76J6jrQPwRzc9FY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AoofFKzSWsFJjs8RzoSuQtMHetfIokIIm0wU0b0jFhZLJ78nFMu4VL7DkHfKBlq5G
	 VAaldFMp3mneaG/KSTyZKtcIWETumJSpeSrGhjmNA9XLxHKnI/qvEDEfDRxBrRjmAG
	 NMDyDikxBbrsDjhiqsXIz7ZNQvw7H2I5gTD1V1/AWcn9gpSMUg521YM0t7xOv/K/zo
	 SmCvzfYpgmzGMOzucjn5gPh6YMMa0N9WQv6Vd3m5pmQZdzSm9k5VJKDaq9Utc7q7Pr
	 YdEiEDRNGNDayM7kpkG1baTtYETAFc+yAYxEAR4Xuz7JWdWC6DQFaw23ouCIzd9fEp
	 tRhwryWOqPvpw==
Date: Thu, 5 Feb 2026 14:35:11 +0000
From: Lee Jones <lee@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, dakr@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sysfs: remove exports of sysfs_*change_owner()
Message-ID: <20260205143511.GA1625457@google.com>
References: <2026020541-energize-graduate-981a@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026020541-energize-graduate-981a@gregkh>

On Thu, 05 Feb 2026, Greg Kroah-Hartman wrote:

> Both sysfs_change_owner() and sysfs_file_change_owner() are exported to
> modules, but there are no in-kernel module users, so remove the exports
> so that crazy out-of-tree drivers don't get the impression that it is
> safe to call these functions at all.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reported-by: Lee Jones <lee@kernel.org>
Reviewed-by: Lee Jones <lee@kernel.org>

:)

> ---
>  fs/sysfs/file.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index 3825e780cc58..a8176c875f55 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -689,7 +689,6 @@ int sysfs_file_change_owner(struct kobject *kobj, const char *name, kuid_t kuid,
>  
>  	return error;
>  }
> -EXPORT_SYMBOL_GPL(sysfs_file_change_owner);
>  
>  /**
>   *	sysfs_change_owner - change owner of the given object.
> @@ -736,7 +735,6 @@ int sysfs_change_owner(struct kobject *kobj, kuid_t kuid, kgid_t kgid)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(sysfs_change_owner);
>  
>  /**
>   *	sysfs_emit - scnprintf equivalent, aware of PAGE_SIZE buffer.
> -- 
> 2.53.0
> 

-- 
Lee Jones [李琼斯]
