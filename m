Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0FB3CFF42;
	Wed, 25 Mar 2026 13:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446402; cv=none; b=oDqqLV/EbNOxXiupS/Jwywh56vZD8+SZeRt6oDQQNWxQp6Hg8QqJuJTTSrmGZRhKjPPm56vnQJribYZR1NHip5g+BYOLzO8E5CmV6wV62LmYEPNBSY5csLX4+KQSMfRkJzxLAAEACrZEIoV4f2WzDZgJY8px07YQjROOIbTKXyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446402; c=relaxed/simple;
	bh=EsepFe1hTb5yu5DvZwZ6ftYofkp6jSkghDu2bLsvZFc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=YBW29S4TNTTtgz8nhXZ0h/hwBotEbCPAXnPAkas6AZkuFSEhJKebWb+dekFS1hrJPqRU4jwzTquVcyfWt6it4P3dvs91g/j4lKLtJJUKLtLeYqZ9rKMXgR9KFLrOkPPA753HMbtJSLjfM2dimz5a/5v1M5MdO/6I77tnx2cnDgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lzc9iRun; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lzc9iRun"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B01C4CEF7;
	Wed, 25 Mar 2026 13:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774446401;
	bh=EsepFe1hTb5yu5DvZwZ6ftYofkp6jSkghDu2bLsvZFc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Lzc9iRunAk7MiPNEUxkZBdZUGG559+UZ9DVpW3Ciygeuez0OPaJRURjDHkplhW3/g
	 ASTg+NyrAwFUpscHzNrkdeqX2gZxv6dVT1gYCHJ2oA06aTK4VtQcuMoMJ4qu74BBuZ
	 Eunp3AqstGSSUAaF909Dmdu9yVkm9mxygGT4MqJHVH1/qv9yFSOFVgX2HD51sxiaCO
	 mbxzUvH8qaIzRq4MGvbezsVtHYokDXHjMGWzpVlbZnbv7Mznr80zDXg4RR8R6aw4jA
	 VZnCFJyx4rJoj0gWRYkKYAz/VDPcPPTytp82xjooGwP25FDwGoA4MR1zp1zca9RsKC
	 eGiUNqVkHMU7w==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 14:46:36 +0100
Message-Id: <DHBWR17G0AIE.30MDYBUT7PNZL@kernel.org>
Subject: Re: [PATCH 1/3] rust: uaccess: generalize write_dma() to accept any
 Coherent<T>
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <tmgross@umich.edu>, <ttabi@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260325003921.3420-1-dakr@kernel.org>
 <DHBVS7DX89G2.34ELW7TJAH7M8@garyguo.net>
In-Reply-To: <DHBVS7DX89G2.34ELW7TJAH7M8@garyguo.net>

On Wed Mar 25, 2026 at 2:01 PM CET, Gary Guo wrote:
> I think there is a reason, which is that it weakens the strong typing tha=
t we
> have. I think it'll be better to have this be
>
>     fn write_dma<T>(&mut self, view: View<'_, Coherent<T>, [u8]>, offset:=
 usize) -> Result
>
> once we have I/O view and expect people to create cast views into bytes
> explicitly.
>

There is technically no difference between the above and the below, except =
that
for the above the user has to create the View first, i.e. it needs addition=
al
code. What's the advantage?

>> +    pub fn write_dma<T: KnownSize + AsBytes + ?Sized>(
>> +        &mut self,
>> +        alloc: &Coherent<T>,
>> +        offset: usize,
>> +        count: usize,
>> +    ) -> Result {

<snip>

> Although, given that we already have APIs like
>
>     fn write<T: AsBytes>(&mut self, value: &T)
>
> I'm okay with putting this in until we have a replacement solution.

Sounds good.
