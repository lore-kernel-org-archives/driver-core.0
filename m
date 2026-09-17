Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D43A3921C1
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640909; cv=none; b=lD26Jku5rvxbM0sgAKZU4/8pe0ectXF/bVPMX2XeuvWUWRvdN7sVHaIaD1kCPWZZnqlV1GqlVQDjCWzKc7EaBJ8tURJ+pA1UuWJ640oTzOG7vHa7hfehDdPO8RcM4QdrZlXinajFHxruw4Y1211G1gJnRB/4kRgbVUzwXZTXZGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640909; c=relaxed/simple;
	bh=/KGrvuzO5WgI2djWZCnyXfveLevJfivnlQ9jhj/0M7Q=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUQHOSoXmU18r7aT2A9VZ27hvgoYLlyNf2zaik4fAx/sc767NO4aMk5uQlz77io2vV3k3s+SPhCMtecdOJVhi0s1BMy4LgCzN5as7eWgW8jGEpo3GbHtE1hqCcExu68rHs7CgHz3zjUtEOFsniu4yaJAVOMqgdbs1Wx6XNzf1TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eno8RS3B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eno8RS3B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9591F0089F
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 10:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789640902;
	bh=fUnCmQJMiMWVZ5F6RQNnetI76cz8E/J8n7008wDjvaw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=eno8RS3Bzcy/1R+Ef38g17VWIzzAmMZusPCGws5p73k6TOV8xG5oRpp8fHU/N0bJD
	 RQDWwUukZO4I1gBidY5VtIqV3ERGOs7sIs2QiRw+a27nyBFUtk6Zh3Ly2lls2sLVSI
	 9SsWNdnri7yvuusUJRYfG5n8CfXeppYvgxiUzCHzdSU7+tE3YDanuMHBNua8wxZeQz
	 oyDuKp7AMo8ca4HZ9Iefj0TzLiUtXXOhfTYaXXrtX+PFbmbu9zZYgRPPOaKuw/R+l9
	 mtU8DWuDXQhevoh//F7161bfE3hBbkTjOs9ms2frkniWNYXQzG6/UDTvUvIqyZjIv3
	 1E9b5cA+7E4dg==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5d0ad9b89so5482771fa.2
        for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 03:28:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhBQSB0OO506mMmpaPMoPQ+wkxRY/41RV2vbG9ec1sbr4C86hTytNXr7nD4bS900HGlRbmFNU+9IGEZA==@lists.linux.dev
X-Gm-Message-State: AFuF++lPabcZqcTjYJ9M+tDszCjiUPbXm46OshPW0jsja6QwPCNfqlHM
	2o9xL3N/ALyqbPcLFyq2H5eGp2lGPdKWu7h4oUXqGa4OiiMtGK9iuWHC8Ttp6mA8xqaK675XLMC
	zVkX6AD6h/UXgUIkjlk8gt3SG04YoCZ93Q1GQqMB1yg==
X-Received: by 2002:a2e:a595:0:b0:3a3:74b9:8a7d with SMTP id
 38308e7fff4ca-3a5dca03df0mr10502251fa.22.1789640901382; Thu, 17 Sep 2026
 03:28:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 06:28:20 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 06:28:20 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260912123529.7951-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260912123529.7951-1-tzungbi@kernel.org>
Date: Thu, 17 Sep 2026 06:28:20 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfohVc8Cg0exc6EQggiq_QgYTpQHLF-OomKFwWO_Ay2gw@mail.gmail.com>
X-Gm-Features: AcwNN1Wk-k5l4_dC4zg7mrE7Or59D0lDd35pgExi6SmDys6wSdeqpqTNlj0MpCg
Message-ID: <CAMRc=MfohVc8Cg0exc6EQggiq_QgYTpQHLF-OomKFwWO_Ay2gw@mail.gmail.com>
Subject: Re: [PATCH v13 0/3] drivers/base: Introduce revocable
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 12 Sep 2026 14:35:26 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> This series introduces the "revocable" mechanism, a synchronization
> primitive designed to prevent Use-After-Free errors.
>
> - Patch 1 introduces the revocable which is an implementation of ideas
>   from the talk [1][2].
>
> - Patch 2 adds KUnit test cases.
>
> - Patch 3 transitions the UAF prevention logic within the GPIO core
>   (gpiolib) to use the "revocable" mechanism.
>
>   The existing code aims to prevent UAF issues when the underlying GPIO
>   chip is removed.  The patch replaces that custom logic with the
>   generic "revocable" API, which is designed to handle such lifecycle
>   dependencies.  There should be no changes in behavior.
>
> Since v9, there are two ways to manage the resource provider handle.
> - Embedded allocation: patch 3 is the user.
> - Dynamic allocation: no user yet; I could find it later.
>
> [1] https://lpc.events/event/17/contributions/1627/
> [2] https://lpc.events/event/19/contributions/2262/

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
