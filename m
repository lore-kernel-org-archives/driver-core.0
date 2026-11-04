Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776277;
	b=smh68hN8cvq9akhf58VrYRnr1q3xsJUSJXfuylOxoinUTf5aAhZiS3XrLkHnap8EaJuu
	 xWZsfXn4IRKYu209GtpIIe/FHMHeaOzM1tIBq+K/Y4BMo1DVy5gL2BB6LnKcd4jHGsbVP
	 jaJW4sWpMpsPnUGRy26J4l9BkD21uWH+EVFBKRqLshHnlxY26HSLQStQk3Q7YAUDmbw3D
	 /jStO4bns73X/2yfZcTXUFjSOlGwUHzIAMEG/SCb0+3ZaXlXrTFEvkzLDjDoTwvHVxaf4
	 Xdf+Zc8pzFl6u+rgRpmgIiSYt+GCvKaG7grDcrJ1vpPR7aGDtanUq8idcLl+lsi+Nuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776277;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MRQOUbeB7bUsXWKOpezUGM/iIyD2tObGKXnfaMckTzk=;
	b=mLHAwFw7534SdJ2K6TkyZWJsypSwhpWbZWrPKkwsqVTW14IIRWX4aI4u8zxNzw29EyNA
	 7SqJHlaidnd6j1rvxkTyEux9ptQPtUARRfDPYpJGMgSoZ0c7z4bPhXJZiOMbFl8Fgl4PX
	 qFHsRLxfR5US7IgPBf3yruFJbLEIrQATAr1YE31PRli0lRQceqQNpsaGXfTmMxk24x37o
	 VAxp7uJn8ypVgMw6w4WOOHD6RUmBsHTqI6vPFd3qmjq+dBsKgnFjObCLThdEXCt+ufjth
	 aza3J7KB9FKa0q1eehyYMMkzl/+2Mo7xHuTl+MdHimTQTU5YJgkmvd/Ps+Qtvhi6Kyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZJYWrKoo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CBD606A326
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 07:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZJYWrKoo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93BB1F000C1;
	Wed,  4 Nov 2026 07:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776276;
	bh=MRQOUbeB7bUsXWKOpezUGM/iIyD2tObGKXnfaMckTzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZJYWrKooiEJUiMmEpgDOjrkiDqwMIu7YTzzWqSgJjhcbRkt7kgZoC/neKr0JanBVf
	 r1BAhkeuSXQBdov39C/cVeVXut9u5+aIUu/aToJRmAm9HNBkJ1fs/RpylldH9KewIa
	 FVMz9+nVirHkoDAjKJFptmsBsRjHVtkOV0YGlcKQ9MVhbT0mPKys78tMnUCPAxzPkG
	 LGBx2EWgc7cp9neixtcdAlAbxZ/1VhdI+O9RapXBLs6RJ19TMZeUqVw1LYbr8v/ctu
	 /Zjdu2hp9u5Mhewz/FMxKktIA6X1uYfQip6oogt0kqWXujKfvW/b9+u0zobiR9k+mk
	 SIU/Q2pitTikw==
Date: Wed, 4 Nov 2026 08:11:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] driver core: don't update the status of an autoremoved
 device link
Message-ID: <20261104-thoughtful-real-saluki-8cae0c@quoll>
References: <20261104025343.1527458-1-vulab@iscas.ac.cn>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104025343.1527458-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:53:43 +0000, Wentao Liang wrote:
> device_links_driver_cleanup() drops the managed reference held on a link
> that has DL_FLAG_AUTOREMOVE_SUPPLIER set and is in the SUPPLIER_UNBIND
> state, and then unconditionally writes DL_STATE_DORMANT to link->status.
> 
> device_link_drop_managed() puts the reference that was taken for the
> managed link, which unregisters link_dev and lets devlink_dev_release()
> queue the work that frees the link after waiting for device_links_srcu
> readers to drain.  device_links_driver_cleanup() only holds
> device_links_lock, so that wait does not cover it and the store to
> link->status races with the kfree() of the link.  Writing the state is
> also pointless at that point, as the link has already been unlinked and
> unregistered by the drop.
> 
> Set DL_STATE_DORMANT only for links that are kept, as
> device_links_driver_bound() already does for the analogous case.
> 
> Fixes: 1689cac5b32a ("driver core: Add flag to autoremove device link on supplier unbind")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/base/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof




