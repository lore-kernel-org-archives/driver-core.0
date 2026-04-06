Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C01D3859CD;
	Mon,  6 Apr 2026 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775487572; cv=none; b=bavP0ETDW8Uauu1+TCYX9H1WpjCJW62dXYwE7jnxxQTqtTwvg1+K/BisFDhr8jT5iD5ZSLjKzDG2xG8StDN9cWLguA1lgy3yU/Zpkxl9Qg93q4BEX2d9vZ8tWvmP7fMNjIkDjf/MtOmXmSw0f1oOZU7BIbBn+oeJbZ6BPtNanBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775487572; c=relaxed/simple;
	bh=NoN3tVeMb4AOcpTf0O8b3X5jRO+sRKap3+GgdT7K6O8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=j2B6JFnzCw4CiuDlonmwsaoQ4ktTjn83EBUhclSZrAOBp1f7pYeWh13yfU0zkvaqrZkLhZM5slZmM9U39EeACvKAxWifk6kJwyxqUhYqCbx7Sjv9+A93AiytWmYbrOzVpHluB7a985DdW2C9PWlJKV/ecxunPV2xxmjYipqo08g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1k2l0wL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1k2l0wL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B55C4CEF7;
	Mon,  6 Apr 2026 14:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775487572;
	bh=NoN3tVeMb4AOcpTf0O8b3X5jRO+sRKap3+GgdT7K6O8=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=W1k2l0wLbXxt8cnNSxiakEY0fbMiS+NH6yMtvCvqtH/mrRqh+z0ATJpdvSM7fTrbg
	 E2ojdiz7HETqg+a8MpcRj0inOLy3+I5InZwazXXHprJVg4a7yE1MLz37oFxQw5m2L3
	 OAdG0ooAhhROdFDy7nyzMCAWJtZ1LeYjvt+w7CKHg13nFnOlyQyxZcEb/VdCmpxZfY
	 23JIKo4mOPGvyvba5S2S2Athm+FBmWOVfW0KP+ox7bbfOgvGptgX/7j/E8s5TCcOlx
	 LCs+nfGWDYxONBYjf7nZ6ojypFJBdUYtcB9Ch35De1+1b72nYRByo4BLcSN4xmp7P1
	 yDknh1lpcALug==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 16:59:27 +0200
Message-Id: <DHM5TCBT6GDE.EFG3IPRP99G7@kernel.org>
To: "Doug Anderson" <dianders@chromium.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 1/9] driver core: Don't let a device probe until it's
 ready
Cc: "Marc Zyngier" <maz@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "Alan Stern" <stern@rowland.harvard.edu>, "Saravana Kannan"
 <saravanak@kernel.org>, "Christoph Hellwig" <hch@lst.de>, "Eric Dumazet"
 <edumazet@google.com>, "Johan Hovold" <johan@kernel.org>, "Leon Romanovsky"
 <leon@kernel.org>, "Alexander Lobakin" <aleksander.lobakin@intel.com>,
 "Alexey Kardashevskiy" <aik@ozlabs.ru>, "Robin Murphy"
 <robin.murphy@arm.com>, <stable@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260404000644.522677-1-dianders@chromium.org>
 <20260403170432.v4.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
 <873418d2fz.wl-maz@kernel.org>
 <CAD=FV=WV2SJwiC7CHEzG=XQJ=tG0P7JSLzU16f0px4j1qmwxUw@mail.gmail.com>
In-Reply-To: <CAD=FV=WV2SJwiC7CHEzG=XQJ=tG0P7JSLzU16f0px4j1qmwxUw@mail.gmail.com>

On Mon Apr 6, 2026 at 4:41 PM CEST, Doug Anderson wrote:
> Hi,
>
> On Sun, Apr 5, 2026 at 11:32=E2=80=AFPM Marc Zyngier <maz@kernel.org> wro=
te:
>>
>> > +      * blocked those attempts. Now that all of the above initializat=
ion has
>> > +      * happened, unblock probe. If probe happens through another thr=
ead
>> > +      * after this point but before bus_probe_device() runs then it's=
 fine.
>> > +      * bus_probe_device() -> device_initial_probe() -> __device_atta=
ch()
>> > +      * will notice (under device_lock) that the device is already bo=
und.
>> > +      */
>> > +     dev_set_ready_to_probe(dev);
>>
>> I think this lacks some ordering properties that we should be allowed
>> to rely on. In this case, the 'ready_to_probe' flag being set should
>> that all of the data structures are observable by another CPU.
>>
>> Unfortunately, this doesn't seem to be the case, see below.
>
> I agree. I think Danilo was proposing fixing this by just doing:
>
> device_lock(dev);
> dev_set_ready_to_probe(dev);
> device_unlock(dev);
>
> While that's a bit of an overkill, it also works I think. Do folks
> have a preference for what they'd like to see in v5?

Except for the rare case where device_add() races with driver_attach(), whi=
ch is
exactly the race that should be fixed by this, the device lock will be
uncontended in device_add(), so I don't consider this overkill.

>> > @@ -675,8 +691,34 @@ struct device {
>> >  #ifdef CONFIG_IOMMU_DMA
>> >       bool                    dma_iommu:1;
>> >  #endif
>> > +
>> > +     DECLARE_BITMAP(flags, DEV_FLAG_COUNT);
>> >  };
>> >
>> > +#define __create_dev_flag_accessors(accessor_name, flag_name) \
>> > +static inline bool dev_##accessor_name(const struct device *dev) \
>> > +{ \
>> > +     return test_bit(flag_name, dev->flags); \
>> > +} \
>> > +static inline void dev_set_##accessor_name(struct device *dev) \
>> > +{ \
>> > +     set_bit(flag_name, dev->flags); \
>>
>> Atomic operations that are not RMW or that do not return a value are
>> unordered (see Documentation/atomic_bitops.txt). This implies that
>> observing the flag being set from another CPU does not guarantee that
>> the previous stores in program order are observed.
>>
>> For that guarantee to hold, you'd need to have an
>> smp_mb__before_atomic() just before set_bit(), giving it release
>> semantics. This is equally valid for the test, clear and assign
>> variants.
>>
>> I doubt this issue is visible on a busy system (which would be the
>> case at boot time), but I thought I'd mention it anyway.
>
> Are you suggesting I add smp memory barriers directly in all the
> accessors? ...or just that clients of these functions should use
> memory barriers as appropriate?
>
> In other words, would I do:
>
> smp_mb__before_atomic();
> dev_set_ready_to_probe(dev);
>
> ...or add the barrier into all of the accessor?

I think this would be a bit overkill; all (other) fields are either already
protected by a lock, or are not prone to reordering races otherwise.

> My thought was to not add the barrier into the accessors since at
> least one of the accessors talks about being run from a hot path
> (dma_reset_need_sync()). ...but I just want to make sure.
>
> -Doug

