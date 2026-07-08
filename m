Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331C9246770
	for <driver-core@lists.linux.dev>; Wed,  8 Jul 2026 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521120; cv=none; b=I3SNY7Xgrshg7DerMs4LUMP3dIFi2r+0ENMivOQwzYcNWEx0hZ1ViGnrtPiFtomPku2dXTFY0KWkMwlXkl92JxnBj6RtqXkATFrJQ8l24V6/JXrmQYsbHfX9WCq3096AI9aF/75pFy4Je40OzGhB7V3+IZK6gC7v3S8I68rAQ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521120; c=relaxed/simple;
	bh=IgXl7iqMESFBSRUjCOfKfddCVOr8JnN+nz0eoLc7Z84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRux3xmf6NfnYGfaS65VD2T5Sy+ykiKzmy3Z/F0gDYslevUf9siIMReArCpy5Pcj+emNXeRFl5PoEkXm1NQoUZNBYtNuoAkANWwUaq16SLaw3Ua1ppyDgVJ93R03LGmS3A2BH24mC8dUcYB5VubOw3SYWcbLvMUSnOaSnJfqF5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kfJfha1F; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kfJfha1F"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e51d3d83cso37114285a.2
        for <driver-core@lists.linux.dev>; Wed, 08 Jul 2026 07:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783521118; x=1784125918; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ptMubsbsUzdG+JxP2QsQOH9vzaQruIf+8B8QS1ntb20=;
        b=kfJfha1F1NRlKLbmTCOed28qnmcZqyQFku9eEFVjDY76tK2KWSuA8SazbrrBzKSwi6
         0pO1kUK1g81d4CvPEQ+n8aAQaWCjSjq2HbeRqTdpcnSBqYwRLzhUYT3TEcO8Pbsoce+e
         tNcq+ikIGmdeVuD8ASlsKwQ9KNSMpUH/JDXFwiaeEmcVXFssE21l35UvfWYFRMwvjIjy
         KF9cEoC+oL9Oa+btWmH8RdPSl2gTt4qHc/q3+DqzSjDyeBjvhQZOWU3g8+6YLp0aKnTl
         uY7Cjy+HblsNQWZCtcnlG9k1/FLJcH6T2XZNLwU+OU+aDYELTjXcrBOd8pu2uySLsDmr
         e+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521118; x=1784125918;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ptMubsbsUzdG+JxP2QsQOH9vzaQruIf+8B8QS1ntb20=;
        b=qka582sMduWpTkB90YnmqImR6bUeQf6ui17oj+RGJ4+ohpFHGRrxOf6U8CAypU7bWp
         VUQvyIS+Af8Z/pdGYTCibwi+G/9S5Prr/aWs2JU6FwBGJoYcuw38qId1L9bkG19C5cIx
         DUFq0Tq47pFewc+UWgapRMKhpUZRv0I9rZD42wWN9XyybUzSenJa2daH1/3G2j5Qir8R
         FsdK+LKv/BpUsJ9QlbbixQROZx5PhGerqlUPpZ8YSXVub9ZvW9zwl1G9Y/Z98qneZLQF
         KUMYe21pxiZpQS3I8sxrdkn7O8SH814TEanB7nedyT4hfV7YLrSkm7833V4Mwg1fn86+
         fA7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqilVbL9gAwNZsoG54vGxj1V6MXnjyWuw7mmbVm5Oq6Jg8G8t9hYpMm+NU/m/CPmcWpEspDMrCOBlm6uA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx3E2FYoK8pTowysNkXo/S3bzzLnMk8+ggYThAb6DfDlVHGHjM
	pLnrFRP3lFfu8aL2JOatTqqxg6PLdPNQDM6mTkMZxqGrCrLL+fE0MwBRg4qeyQJQ+lk=
X-Gm-Gg: AfdE7clHZeM4l189TE7zuPab5Mnc/VZlaR3F8QZh8fy0YPLl77kzaznzNaEmQsSCr45
	Qr0pv6xmE0kKB6mCRHK9uLtHb6tZQnb0/c6M0W3+aQTHfgy7UKQEvWiCUoYWuRSTvMx2+vI5Bm7
	scZ0kCr5GyuGRy0wXfgbQ4BOFp3nK+u2tgXBB0d+rAtkWNvl1PXII2jqrphbi6Z2XNqtL3G1kIF
	xTUMvWg6vicpcfK9dgRIBMnSWbNN6yLfUfaHpckQn9PkFlyXz2Y+l64FH1/r7LxwzqDnQ05F18a
	ry0zg8PJdvVfnaiI7RNWQAZMlNqXzLVzWDbfmjEXy0n54kOifzCLrKRsahBOt9RHLEJB4mEQoso
	xV29z8GOwcYG9MAYu8051x4RybNisVR6Xb6tmoj8W3l9QM3zfZJP8I54OVPsxl3p8j7L/+Do=
X-Received: by 2002:a05:622a:15c7:b0:51b:ee04:5a4e with SMTP id d75a77b69052e-51c8b430fdfmr26314881cf.31.1783521115163;
        Wed, 08 Jul 2026 07:31:55 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41d2cde7sm146585651cf.18.2026.07.08.07.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:31:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1whTJZ-00000002wbD-1YEQ;
	Wed, 08 Jul 2026 11:31:53 -0300
Date: Wed, 8 Jul 2026 11:31:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Dan Williams (nvidia)" <djbw@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org,
	driver-core@lists.linux.dev, ankita@nvidia.com,
	Aaron Tomlin <atomlin@atomlin.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, Petr Pavlu <petr.pavlu@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security
 Protocol (TDISP)
Message-ID: <20260708143153.GH118978@ziepe.ca>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <20260706125140.GB107792@ziepe.ca>
 <6a4c163072c60_174db6100c4@djbw-dev.notmuch>
 <20260707124321.GF118978@ziepe.ca>
 <6a4d95fcc92c2_2f05d5100f7@djbw-dev.notmuch>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a4d95fcc92c2_2f05d5100f7@djbw-dev.notmuch>

On Tue, Jul 07, 2026 at 05:12:44PM -0700, Dan Williams (nvidia) wrote:
 
> 1/ We previously discussed a use case to operate a device's private MMIO
> while not allowing access to private memory (software encrypted NVME
> with private MMIO [1]). Many of the following comments are based on
> preserving this assumption so you can save some reading if we agree that
> use case can be abandoned.

force_dma_unencrypted() does not *prevent* device access to private
memory and provides no security properties on its own. It's only
purpose is to inform the DMA API what the HW restrictions are for
doing DMA.

The use case I had in mind relied on the vIOMMU to police access to
the private memory. I think if you do T=1 and ADVERSARY you must have
a vIOMMU or it is an illogical configuration.

So, IMHO there is no use case for a T=1 device to only use shared
memory, I would abandon that combination.

> 2/ The confirmation of the trust level and the enabling of DMA are
> separated in time from setting the trust level and entering the RUN
> state.
> 
> All the archs separate the RUN step from the ENABLE DMA step, and the
> implementation separates those steps in time.

Yes, until the device is fully accepted the DMA has to be kept off. If
you have to measure in the RUN state then we must have a second step
after measurement completes, however we are measuring in LOCKED right?

> echo tsm0 > $pdev/tsm/lock
> cat $nonce | device-evidence dump $pdev
> device-evidence validate $pdev $generation

So the device is in LOCKED here, DMA remains off both because of
LOCKED and becuase ENABLE DMA has not been done.

> echo 1 > $pdev/tsm/accept

And now it is RUN. So I don't see the issue with enabling DMA at the
same time as gonig to RUN? (though defering it to driver probe would
be a very nice touch as well)

With this API you can't set the devices to RUN and *then* collect the
evidence, is that restriction OK?

> echo full > $pdev/trust
> echo $pdev > $driver/bind

Then we can set the trust and bind the driver, knowing that the T=1
security property is in place.

> The configuration window where $pdev/trust and $pdev/accept can be
> dynamically changing should not be changing the force_dma_unencrypyted()
> result if only because that value will mismatch the hardware state until
> the next ->dma_configure() event.

T=x cannot be changed while a driver is bound, we need to block
that. Changing it will mess up all DMA and the DMA API won't work
anymore.

Thus force_dma_unencrypted() can only change when a driver is
unbound.

If a driver is unbound nothing ever reads force_dma_unencrypted() so
it is safe to change it, thus we can just synchronize T=1 and
force_dma_unencrypted() whenever T changes.

The error case has to wait for the driver to unbind if userspace wants
to go from ERROR->UNLOCKED. IMHO for RAS we are going to need a flow
to logically go from ERROR->RUN, probably with the 'same device
acceptance' I suggested earlier. In this case the DMAs will be halted,
the devices gets back to T=1 and RUN, then the DMAs are turned on
again. The driver remains in T=1 and force_dma_unencrypted() is always
false.

> There are also buses and paravisors that may know that private-DMA is
> enabled for a device by construction. In that case it is also a "trusted
> to access" signal, and not a "required to access" signal.

In this case they wire force_dma_unencrypted()=false.
 
> My answer, given the concerns of drivers dangerously flipping the
> force_dma_unencrypted() result at runtime was to place it in 'struct
> device_private' 

Yes, this seems good idea in general

> Otherwise it is confusing when 2 devices are at FULL trust, but
> one has private memory access and the other does not. One is FULL the
> other is FULL+.

It is confusing when phrased like this, but this is also why I was
suggesting below that a pure trust level may not be sufficient as we
have quite a cross product of scenarios.

If the user wants to operate a device without T=1 and without
ADVERSARY then that's goofy, but technically the kernel doesn't really
need to care? It can do it.

IMHO a big question is how much do we want the kernel to nanny
userspace by having options to double check its work?

Either we trust the user to have checked all the policy conditions
before writing /sys/trust, or we encode some policy conditions and
tell the kernel so it can double-check prior to probe.

At least if we omit the double check it can be fairly easy to add in
later if it really was needed for some time of use reason.

> The question is whether these requirements belong on a central device
> trust mechanism bitmap or should be pushed out to other ABI.

Yes, for sure, I don't have a good sense what is better.

> For
> example, if the presence of the secure IOMMU is enumerated
> after the device is in the LOCKED state then userspace policy can know
> what it is getting into without needing to tell the kernel. 

Yes, I think for almost all of this we could push it out to userspace
and have knobs all over. Like IOMMU already has a knob to switch to
DMA mode, we could add an IOMMU specific trust level to set ADVERSARY
also if we go in this direction.

But, I also do really like the idea of a central knob that was fairly
general and simple DISABLE/ADVERSARY/FULL which all sorts of things
can hang off. Including IOMMU and the drivers themselves that may
change operation in ADVERSARY mode.

That means they need simple general definitions for what they are, and
I really like this ADVERSARY naming vs trust as it makes it very clear
what the device disposition intention is.

> Not essential, but it is useful to have the "operate device" intent,
> IOMMU default domain configuration, trust level, and private DMA enable
> all in the same bus operation (->dma_configure). Which is why "accept"
> was demoted to just set RUN state and leave the rest to be finalized
> later.

I agree it is nice, and I think this can work fine, the bus code when
it does the dma configure step can reach out to the TSM and have it
enable DMA.

We also want the IOMMU to change to a default-disabled state, so we
also want its hook in dma configure to switch to non-default too.

It makes alot of sense to me that *all* DMA enable knobs will be
disabled until right before probe starts and then disabled again once
remove completes. TSM, IOMMU, PCI, etc.

Jason
