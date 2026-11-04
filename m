Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789533;
	b=ZKJFz+QZu/1VEw8YAJl7YEUijd7BORfhvf3RaUyE9jNpIzywmHjPldjINzu8sSV0Baqc
	 OMLUycgF7t5oD37Dw9xcTW2h3mzQhea1MCHXGa2Tmfu2rpqxlqYRC3lwZNhSArPWSjCzo
	 NuJF8T/Gm1smA0n6jPCNwsqieySNHYq6NrDXGKzXJvT5+mjkKKd7chfNBZEpv/sMx9MCT
	 LD6S0RD8/khiVOGKFrNM/DlMeSGgsMusK/VOZMT1DzV8Uv59Lj4XJLmWP7TCxR/+Gf7tj
	 o3TGkf8YvJ+QtM6fs4negooOyU9CmahU7Rif/mogcx8w6wDsrTms2aE+Vd6DfRMnjRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789533;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SWBtc5MM6lAsWLzbe3HjjfI/t1G5G7qVzrPwaoOHj0c=;
	b=INBCWg957iS1CePo/HnGo2SXK1BnNJvi/vC5rXN75Cz3eWB3KDufbugiimLdELI2T7CU
	 LJ+WofoymwQKpIr4dcxhmfOO/j0Rhp2eDlaR0PzINS7WOcctzP5Xo1u2dzn2J38XjNZf0
	 1onDVFdcyMl7sMkmxTwiQ5nqxgSB/U/W+dcJHxwZ3paRuCIfUHnAUHM+Z8nDKKTVt9DpM
	 D+0B0bL1H+/HZPT3ly8wEt6joELKUIk8zGjcdjynI5Bzj2J74RVvsWcNFbCRNLls+uzd4
	 tj6V/e0nd4EmJY4hBN7uOmeRYze/ykoJVmYwws6EYwHQjLgG0HseTSd8nc+oOuX4quQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=peEq42YG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5375D606A326
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=peEq42YG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86E81F000C1;
	Wed,  4 Nov 2026 10:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793789532;
	bh=SWBtc5MM6lAsWLzbe3HjjfI/t1G5G7qVzrPwaoOHj0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=peEq42YGXTzsDAfhCPDspEfFoQnhVkRmyTPFabc8uRXeAKdQP8G0cwZgglF4sN6ln
	 YoWWKJfFLhrbWV8eKhTLcaz4Qo+tsV8fCyrRnjqKYi9g71iBkYdADIKlbnU19PQkdU
	 n9EukkTRUUCyVXsmA4VPuIiXspvHwTXdg5fR9o/M=
Date: Wed, 4 Nov 2026 11:52:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev, Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] driver core: don't update the status of an autoremoved
 device link
Message-ID: <2026110438-washbasin-stylishly-8e48@gregkh>
References: <20261104025343.1527458-1-vulab@iscas.ac.cn>
 <20261104-thoughtful-real-saluki-8cae0c@quoll>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-thoughtful-real-saluki-8cae0c@quoll>

On Wed, Nov 04, 2026 at 08:11:13AM +0100, Krzysztof Kozlowski wrote:
> 
> On Wed, 04 Nov 2026 02:53:43 +0000, Wentao Liang wrote:
> > device_links_driver_cleanup() drops the managed reference held on a link
> > that has DL_FLAG_AUTOREMOVE_SUPPLIER set and is in the SUPPLIER_UNBIND
> > state, and then unconditionally writes DL_STATE_DORMANT to link->status.
> > 
> > device_link_drop_managed() puts the reference that was taken for the
> > managed link, which unregisters link_dev and lets devlink_dev_release()
> > queue the work that frees the link after waiting for device_links_srcu
> > readers to drain.  device_links_driver_cleanup() only holds
> > device_links_lock, so that wait does not cover it and the store to
> > link->status races with the kfree() of the link.  Writing the state is
> > also pointless at that point, as the link has already been unlinked and
> > unregistered by the drop.
> > 
> > Set DL_STATE_DORMANT only for links that are kept, as
> > device_links_driver_bound() already does for the analogous case.
> > 
> > Fixes: 1689cac5b32a ("driver core: Add flag to autoremove device link on supplier unbind")
> > Cc: stable@vger.kernel.org
> > Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> > Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> > ---
> >  drivers/base/core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> 
> Multiple things here:
> 1. Your team ignored completely previous feedback. Multiple times.
> 
> 2. You use multiple identities with this email address, thus I doubt that we
>    speak with an actual person.
> 
> 3. Your bot does not even bother running checkpatch, right?
> 
> 4. Nothing of this was reproduced nor tested.
> 
> 5. Finally, the same feedback:
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
> 
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
> 
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.

They are now starting to send out private patches and avoiding the
mailing lists entirely.  Time to do something a bit more drastic to stop
this mess...

greg k-h
