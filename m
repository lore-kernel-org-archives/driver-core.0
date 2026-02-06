Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E9B2FC876;
	Fri,  6 Feb 2026 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375871; cv=none; b=L0rR8rPLF130un92mIEf3p3NDrRgLSdXJPpmlkW4AVYvS3/U2ZIFWbJ95ysqBQD8ThgzVVpPozVgIPNt00C0VFNoop3YbhsHJr+5BcNiohKqni0Ry1Qd8/KYWoAR0bY/c5bGZuWgB3887TBeWOTuBVFOpcJTZ6r1THcDHFidQPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375871; c=relaxed/simple;
	bh=gJwyDSpeTpfB8KPST4brZlOeQbnA+MS/g15YTQQcBI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xy6jQBfHvOsFVI9u3kgzIxjUAB+9WD5MEJzAsawJqkaLR2DcnrIleHoCCovsDnV6kn0H9K0k8tbYXEfiHR5u+4R3FGXkaJH6P5nm4NNOB4Dokwtd/0U7vnC60zaq6VxHXuxyc4aGtkHUjNHTBL8aOdAAOCw8VEfNdLuggLScaPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GZ4Gu9YY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GZ4Gu9YY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976B4C116C6;
	Fri,  6 Feb 2026 11:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770375871;
	bh=gJwyDSpeTpfB8KPST4brZlOeQbnA+MS/g15YTQQcBI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GZ4Gu9YY+++bR+FdN5IkEYqh85sYFIL9eUujYncgXC3abPVvlDfHmXGf+Dd3gohE9
	 BfAiAcJJx5nIPiTIStxKWaGBfuD44Ql2yt9i5dv8aLaZvetXeZGK7X7+I4pCPvyp+s
	 IW3QCZnPqJQTkr5z1+udentnJNHgkdynk6RwBAqY=
Date: Fri, 6 Feb 2026 12:04:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and
 devres_node_add()
Message-ID: <2026020633-democrat-moisten-631a@gregkh>
References: <20260205224706.91996-2-dakr@kernel.org>
 <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>

On Fri, Feb 06, 2026 at 11:43:48AM +0100, Danilo Krummrich wrote:
> On Thu Feb 5, 2026 at 11:31 PM CET, Danilo Krummrich wrote:
> > +EXPORT_SYMBOL_GPL(devres_node_init);
> 
> I actually intended to use a Rust helper instead of exporting those symbols
> directly, but forgot to do it eventually.
> 

I don't understand, does that mean we do not need to export these?
Shouldn't the rust bindings just export these symbols are rust exports,
and the C exports are not needed?

We "only" want these symbols to go to the rust binding, not to any
module at all, which is what this patch series does, and is probably not
a good idea.

thanks,

greg k-h
