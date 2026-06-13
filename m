Received: from outbound.st.icloud.com (p-east2-cluster3-host1-snip4-1.eps.apple.com [57.103.77.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302B03ACA5E
	for <driver-core@lists.linux.dev>; Sat, 13 Jun 2026 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.77.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781343966; cv=none; b=LWj64xa727EnNM4CIHUYKVSr4xaLZqAlrDfIiHgO2JavmSOdnkBRezq8IY9Yl8bW2lJQ+pSAfAVBMIUfaOxBe0vTKCv8kGrFVfaNqNdzW/sRaStWEgoRpGh8o0n7HRutOksAKY81hmwDxdVbEnDaPmOrEB06Oq/f0Y0UlNDDHtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781343966; c=relaxed/simple;
	bh=22vXQpGvky3ahpUUcPhuHCluJZbkbpVSN1/Gc4gPzgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzwl69w0V3xUWnqQposiyWzrv/W5TGOxCQkB+At2jS36Sg3bbn6lNv2vEP0j3FFwNTany2QHpWLa8svsEvaYZP0z6CXBna2Fgkxxo5mYIwKgT8bO6qjL9aB1X8u442HvWa4OiLcgQeV3wam8uxyC6tFq3mYlDqBIKCJojDnGCmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net; spf=pass smtp.mailfrom=y-koj.net; dkim=fail (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b=KobOkf/k reason="key not found in DNS"; arc=none smtp.client-ip=57.103.77.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=y-koj.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b="KobOkf/k"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id 4E5F61800178;
	Sat, 13 Jun 2026 09:45:59 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhJA0MBXBxHCVYCXAdLVxQEAVgtTkZZH1NWXQhDS1QUBAEeBlgBHB5cDBMfVFYHUFEdXwIKBEcEWxdGA1NFQQQXEVABWB5WXloXXk1HH0BNYkkBWhlbHEAXSm5NUw8PCRQTXAcZBVcEGRVaCQpXUxkJFQMMQxFRQFogZ11OOnIUXAtYGVgbHAkUE1wHGQVXBAdYRxRHDg8TTAtHAlo0Vh9UGVoD
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=y-koj.net; s=sig1; t=1781343962; x=1783935962; bh=sdT7hW3WHAcVd56B43lLuG/P2r48ORNPXsPw/SMrHb8=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=KobOkf/kjJuDNM/4Ic+R7J5sK4olr2SrhbLOec/tB7pCujcS12JVLOb8qps+GKE5zPQ3m+6umrEU5q0BiLMB4hZ+QkweERRtIJb0tm3bpsUiasDWEHMMl7PWsl5hFPEii4znIS0WVarUJ5mHpD/keSdzGrdhwbn8kHUoM9UVjIdpZKy7IGihgOLmHsCPLE4Thb07didXWpCw69Pv6sP5Ewvc5bqZnvFghD8zsBu4l41Fyg2Y5irf840XX4WYzGLKprP1/J3P1smNzjTJnz6emZTpmdHgtOzG33paKRal4pBkCJdggm0MQCX+09WboeImm1hxQSrHFuialx4LN7Pl7w==
mail-alias-created-date: 1719758601013
Received: from desktop.y-koj.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 10FE31800388;
	Sat, 13 Jun 2026 09:45:56 +0000 (UTC)
Date: Sat, 13 Jun 2026 18:45:53 +0900
From: Yohei Kojima <yk@y-koj.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] debugfs: warn if file creation failed due to
 uninitialized debugfs
Message-ID: <ai0m0atzc0cXT0yQ@desktop.y-koj.net>
References: <6d1dc775f7d5e754d734907514534054f682bac5.1781171918.git.yk@y-koj.net>
 <2026061240-cheddar-recolor-63d6@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026061240-cheddar-recolor-63d6@gregkh>
X-Proofpoint-GUID: QjiwyemNFsHYdY1P6l4UCevTidTfO4Hf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA5OCBTYWx0ZWRfXwdr5u675fBnK
 pSBACa3NPqG5oPGLda+k6l55JCWmj129IiRd9DYUr82FM93OGFYDHArX4+52jy0Ok9WGVFv+K+h
 OjRB0vNq/qzHsXtLyHYNEKXq8Uvps+v2wyrHM216Lf1BGIHIp6d3mSYA91TUARpZkiJVQbDHVJu
 2RVtLifzpEewMy2Jbdt/2jafnAKoH+IPYGAYDovW9CIEQzehxbq1a6tEZSMn/eJ3LCs6G5hBrih
 JT2zUr2QsI9+azkQuM30g4khm1Ny2FBo6eE7LY+g4n6Vy/qF0azl97EtIwztl2gdkqiQYJsmiaq
 qjaCJlHnyPScRNFirv6
X-Proofpoint-ORIG-GUID: QjiwyemNFsHYdY1P6l4UCevTidTfO4Hf

Hi Greg,

Thank you for the response.

On Fri, Jun 12, 2026 at 10:14:34AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jun 11, 2026 at 10:50:16PM +0900, Yohei Kojima wrote:
> > Improve debugfs_start_creating() to warn if it was used before debugfs
> > initialization. It silently returned ERR_PTR(-ENOENT) before, but it is
> > hard to find the cause of failure especially if it was called by
> > debugfs_create_dir(), because the document of the function says:
> > 
> > > NOTE: it's expected that most callers should _ignore_ the errors returned
> > > by this function. Other debugfs functions handle the fact that the "dentry"
> > > passed to them could be an error and they don't crash in that case.
> > > Drivers should generally work fine even if debugfs fails to init anyway.
> > 
> > Signed-off-by: Yohei Kojima <yk@y-koj.net>
> > ---
> >  fs/debugfs/inode.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
> > index 4598142355b9..e054e62919ec 100644
> > --- a/fs/debugfs/inode.c
> > +++ b/fs/debugfs/inode.c
> > @@ -368,8 +368,11 @@ static struct dentry *debugfs_start_creating(const char *name,
> >  	if (!debugfs_enabled)
> >  		return ERR_PTR(-EPERM);
> >  
> > -	if (!debugfs_initialized())
> > +	if (!debugfs_initialized()) {
> > +		pr_err("Unable to create file '%s', debugfs is not initialized yet\n",
> > +		       name);
> >  		return ERR_PTR(-ENOENT);
> > +	}
> 
> While I understand your frustration when adding new code to the kernel
> that would trigger this, does it actually fail on a normal boot today?

No. As far as I tested, no existing code faied there.

> If not, is this really needed?

At least I want. Also, debugfs_start_creating() already warns if the
caller is trying to create a dentry with the same name of an existing
dentry, which also doesn't happen on a normal boot. The warning for
uninitialized debugfs helps developers avoid pitfalls in the same way.

Thanks,
Yohei

> 
> thanks,
> 
> greg k-h
