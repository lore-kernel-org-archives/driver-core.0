Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793405130;
	b=H44o+5OHxKYX8RYYagPL4rRCFqr0z5diUhUcNU1abhbSJYfRPt7GJPziIMORI2t9AzTH
	 SVbcBK07zS6cYLyAgXLp+g6fUqtyX3a8wnqQENNLFXna+TaQDSFPk9cfx1y1Hn4rpH+c4
	 DzAG0VETAYepNUYNNWjFj65caXi6BuXTqVTZyKK5lVFuwYoJlqWmhhL32OicJmXHsP+js
	 BK5LWG5qPNccIJmMB8Azjqf/k7buk/A++0wLx1GTWrFCoYLRtKVljgy5G6/LHcK3rhS8P
	 KrbFpFmPpFPPSLuEK1hlQ4G0FM0sn3jvwOk9zMN/6PLlp225O1pCc/duutDeXMLFCEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793405130;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp;
	bh=f9yLN0RkK2Stc/zltKXQAqZKvxbRR8oE2ZWmMs+DjYY=;
	b=ZN/CuiGdqWVSQh9tQhm5pOYZkDcuOQWoNMX8CxN8HvqnOS+9NRfY9eO1ribJBqSoG05a
	 F0RQZaYZ+43s0c3lqlSGffw8xtRSYu5wUFtOGEpkCXcND3AcLY2ohPBwjN1iKSO+KQuj1
	 w0RJe3/ZU5ZavqiYfnfwFjgy1Eg8l4kYl8tu9gx9mSM5rK60q/JM+2oy6/sHMnGzI8N+/
	 SurS5ZVPFDHQadNCJwgYqXI6lmVPV1AvQrnOswjUCpjQoaeUk5aQpos7nPrqU1jZsgXh2
	 G8xAiBXemLbtJAJrFNF276HaCytaJJxSlPYgh6w27abEbriYdtDkm2Pm9HXJzMqh/NA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b="hr/cVHWZ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8859606A31A
	for <driver-core@lists.linux.dev>; Sat, 31 Oct 2026 00:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8859606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=hr/cVHWZ
ARC-Seal: i=1; a=rsa-sha256; t=1793405100; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bZnuB2JRIAo5BQbq0eqVFPpyTHolRV6/OKsdm6eLSklINLhpeygWJ2q8RytLnTllVesDo4eYdbNcLLZ8Shu6ArppdRZhqfVYkOe89TNDG8OkvjEstUGdSG3A/MnQC4gblemQSwO9pEveQWCPVElYqIShEgdSLG2l9yr+hLSi7/Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793405100; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f9yLN0RkK2Stc/zltKXQAqZKvxbRR8oE2ZWmMs+DjYY=; 
	b=UV6+97th1ByaATcIIiz8w3uuQ649atGFFaH19Othp5jTvHQeoUxSGZKORBUWJTHKAm5VeOCa3z3z5wRgISMDBMVprkvhQK605ZiJnCCdTb/IEEyggR1Hu0riXlZSXInz4zZ5XA6zyIgSfvwIS2e9lJZJAk29d59ct6N6OJXEL/0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: a=rsa-sha256; b=hr/cVHWZ3xZpO9zKcwmtmOY1N5jRHw8tunxASI99mON3or5AjFWCRzzQoktxiMN2d9GhzB4BggAqsFTCfnJCtTYPDK5ft/ZflZMtmj1bKJVcoMrCVhuv8HVJ7IIGj532XDY6iXMuXRszWn1E93s0jkjRejGkCsAry+hq1O2x1wE=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=f9yLN0RkK2Stc/zltKXQAqZKvxbRR8oE2ZWmMs+DjYY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793405097674331.3192838468908;
	Fri, 30 Oct 2026 17:04:57 -0700 (PDT)
Date: Fri, 30 Oct 2026 17:04:56 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Lorenzo Stoakes <ljs@kernel.org>, Lyude Paul <lyude@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	driver-core@lists.linux.dev, Alvin Sun <alvin.sun@linux.dev>
Subject: Re: [PATCH v5 09/11] rust: device: expose the device DMA attribute
Message-ID: <auUwqGMOw_OtrWn3@um790>
References: <20261027-tyr-ioctls-v5-0-59dfe98cb003@kylinos.cn>
 <20261027-tyr-ioctls-v5-9-59dfe98cb003@kylinos.cn>
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
In-Reply-To: <20261027-tyr-ioctls-v5-9-59dfe98cb003@kylinos.cn>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/293.393.56

On Tue, Oct 27, 2026 at 12:41:02AM +0800, Ke Sun wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> A driver may need to know whether its device is DMA-coherent, but
> rust/kernel exposes no accessor for the attribute today.
> 
> Add a transparent DmaAttr wrapper around device_get_dma_attr(), so all
> three attribute values (unset, non-coherent, coherent) are covered, and
> an is_coherent() accessor for the boolean case.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [ Replace dma_coherent() with a DmaAttr wrapper covering all three
>   attribute values. - Alvin ]
> Co-developed-by: Alvin Sun <alvin.sun@linux.dev>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
>  rust/kernel/device.rs | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index 2291d85b6849e..d5bbebdf620df 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -260,6 +260,30 @@ pub unsafe fn drvdata_borrow<T>(&self) -> Pin<&T> {
>      }
>  }
>  
> +/// The DMA attribute of a device, as reported by firmware. A transparent
> +/// wrapper around the kernel's `enum dev_dma_attr`, covering all its states.
> +#[repr(transparent)]
> +pub struct DmaAttr(bindings::dev_dma_attr);
> +
> +impl DmaAttr {
> +    /// This wraps `device_get_dma_attr()` and only returns `true` for the
> +    /// `DEV_DMA_COHERENT` attribute; no attribute or `DEV_DMA_NON_COHERENT` is non-coherent.
> +    #[inline]
> +    pub fn is_coherent(&self) -> bool {
> +        self.0 == bindings::dev_dma_attr_DEV_DMA_COHERENT
> +    }

I think Danilo was suggesting in the last version that all three enum
variants be exposed to the caller. You could remove this is_coherent() helper
and just provide something like this:

     /// The device has no reported DMA attributes.
     pub const NOT_SUPPORTED: Self = Self(bindings::dev_dma_attr_DEV_DMA_NOT_SUPPORTED);
     /// The device is not DMA-coherent.
     pub const NON_COHERENT: Self = Self(bindings::dev_dma_attr_DEV_DMA_NON_COHERENT);
     /// The device is DMA-coherent.
     pub const COHERENT: Self = Self(bindings::dev_dma_attr_DEV_DMA_COHERENT);

Then as long as you annotate struct DmaAttr with:
#[derive(Clone, Copy, PartialEq, Eq)]

Tyr can later do its own check like this:
  let coherent = pdev.as_ref().dma_attr() == DmaAttr::COHERENT;

> +}
> +
> +impl Device<Bound> {
> +    /// Returns the DMA attribute of the device as reported by firmware.
> +    #[inline]
> +    pub fn dma_attr(&self) -> DmaAttr {
> +        // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer
> +        // to a `struct device`.
> +        unsafe { DmaAttr(bindings::device_get_dma_attr(self.as_raw())) }
> +    }
> +}
> +
>  impl<Ctx: DeviceContext> Device<Ctx> {
>      /// Obtain the raw `struct device *`.
>      pub(crate) fn as_raw(&self) -> *mut bindings::device {
> 
> -- 
> 2.43.0
> 
