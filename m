Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CE433AD9C;
	Fri, 14 Aug 2026 22:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786745215; cv=none; b=WeX5uDdAgZzGqvUZMQfFRfnVnDNZtcWrxcffEzrJE+IHzegDhqa9zV/Nor4iKr8sPfWOBNaR32n+jNXLoqsMGJ4f0UxcYdOMmHo77Ro8CRnN9CoruJ8d0PQYXZzAWZQuNFJmijiqxtgnE7I6PSnwZwas6nOnD8LD927YoBYszvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786745215; c=relaxed/simple;
	bh=EufpaXXhKMHDEVfiedwoffqSzzpZZ33SZCyhfE2psQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OnKjaTn/Cn9nf/j+B2T2HJK5Px1IzpIQev1LqtFHtFWXpD9+w+APV7QMJE/kLx8vtCPxNQa7DztdGnL35U/4AJukHOHnhx8xjdyepxLqCbZzGU4fCCJzd7gKAJSf7C4bVZwVcsEn/W9xmRM7GxrNtGwXcuag5SlCD39Jp4e5EsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ksZSNSI4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ksZSNSI4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C631F000E9;
	Fri, 14 Aug 2026 22:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786745213;
	bh=43EJgsZqDVbV2DjeQ/GksSldFhIpCXxnr2u8QDpaJTE=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=ksZSNSI4qVp+ZNRnuKGiTDmtvihG+f7HWyfWu2U1CiOA3t/q5PKYI7YJ9NbEq6uRV
	 D1jYBvEV7wqvdR04OkcmBhnYokh+Wu5TslKBH23vlbNwABCAvnmcEfzo0uklmfykB+
	 PSs7TYmstpmM9IplQYRPBEPgX6hwdygvzrMd6QJd99Rgdk96OrMPyzNMEsjcsHp5j4
	 sQZ+o6W51tNRUvvePQpHrg68dzF/4BE0AczHorskc3vcR7bobDUz9yVyUAyA7WjVPb
	 vF8xyU5ge7/TjD7iu9+JC30YEs+cG++044TwKr54O1NJUZ88ghk7jY/fR1y44NNbMB
	 ugxObgm8V7PJA==
Date: Fri, 14 Aug 2026 17:06:52 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Tarun Sahu <tarunsahu@google.com>
Cc: dmatlack@google.com, Nicholas Piggin <npiggin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sourabhjain@linux.ibm.com,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Russell King <linux@armlinux.org.uk>, radheys@amd.com,
	skhawaja@google.com, djeffery@redhat.com,
	Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-arm-kernel@lists.infradead.org, souravsgl@google.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v3 2/3] firmware/edd: use kobject_put() on
 edd_device_register() failure
Message-ID: <20260814220652.GA101268@bhelgaas>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814210057.4102768-3-tarunsahu@google.com>

On Fri, Aug 14, 2026 at 09:00:56PM +0000, Tarun Sahu wrote:
> As per koject_init_and_add() function kernel document, even if this
> function returns error kobject_put must be used instead of kfree.

Thanks for adding this specific pointer.  I wouldn't repost just for
these nits, and wait at least a few days before reposting for any
reason.  But if you do repost:

s/koject_init_and_add/kobject_init_and_add/

Might also add "()" after function names consistently (kobject_put and
kfree above, edd_release below).  Also applies to the other patches.

The current subject lines basically restate the C code; you might
consider more of a focus on the problem.  I ran this through gemini
and I think it did a decent job:

  firmware: edd: Fix kobject reference leak on registration failure

  Per kobject_init_and_add() kernel-doc, calling kfree() directly on
  error bypasses reference counting and skips the kobject's release
  callback, leaking the reference.

  Use kobject_put() instead of kfree() on registration failure to fix
  this.

> When edd_device_register() fails after initializing the kobject with
> kobject_init_and_add(), calling kfree(edev) directly bypasses the
> kobject release callback (edd_release) and leaks the allocated kobject
> resources.
> 
> Fix this by replacing direct kfree(edev) with kobject_put(&edev->kobj) on
> registration failure.
> 
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  drivers/firmware/edd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/edd.c b/drivers/firmware/edd.c
> index f980c5b56858..763e7b16d517 100644
> --- a/drivers/firmware/edd.c
> +++ b/drivers/firmware/edd.c
> @@ -748,7 +748,7 @@ edd_init(void)
>  
>  		rc = edd_device_register(edev, i);
>  		if (rc) {
> -			kfree(edev);
> +			kobject_put(&edev->kobj);
>  			goto out;
>  		}
>  		edd_devices[i] = edev;
> -- 
> 2.55.0.691.gc56d675ccc-goog
> 
